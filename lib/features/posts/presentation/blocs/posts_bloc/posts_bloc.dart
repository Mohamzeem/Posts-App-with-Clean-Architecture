import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/core/consts/app_strings.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/features/posts/domain/usecases/get_all_posts.dart';
import '../../../../../core/errors/failure.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  PostsBloc({required this.getAllPostsUseCase}) : super(PostsInitialState()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(PostsLoadingState());
        final failuresOrPosts = await getAllPostsUseCase();
        emit(_faliureOrPostsStates(failuresOrPosts));
      } else if (event is RefreshPostsEvent) {
        final failuresOrPosts = await getAllPostsUseCase();
        emit(_faliureOrPostsStates(failuresOrPosts));
      }
    });
  }
  PostsState _faliureOrPostsStates(Either<Failure, List<Post>> either) {
    return either.fold(
        (failure) => PostsFailureState(message: _failureMessage(failure)),
        (posts) => PostsSuccessState(post: posts));
  }

  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailureMessage;
      case EmptyCacheFailure:
        return AppStrings.emptyCacheFailureMessage;
      case OfflineFailure:
        return AppStrings.offlineFailureMessage;
      default:
        return AppStrings.unexpectedMessage;
    }
  }
}
