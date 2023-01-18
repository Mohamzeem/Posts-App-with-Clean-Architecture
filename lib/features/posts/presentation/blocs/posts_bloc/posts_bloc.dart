import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/features/posts/domain/usecases/get_all_posts.dart';
import '../../../../../core/strings/app_failures.dart';
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
        emit(_failureOrPostsStates(failuresOrPosts));
      } else if (event is RefreshPostsEvent) {
        emit(PostsLoadingState());
        final failuresOrPosts = await getAllPostsUseCase();
        emit(_failureOrPostsStates(failuresOrPosts));
      }
    });
  }
  PostsState _failureOrPostsStates(Either<Failure, List<Post>> either) {
    return either.fold(
        (failure) => PostsFailureState(message: _failureMessage(failure)),
        (posts) => PostsSuccessState(post: posts));
  }

  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppFailures.SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return AppFailures.EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return AppFailures.OFFLINE_FAILURE_MESSAGE;
      default:
        return AppFailures.UNEXCEPECTED_MESSAGE;
    }
  }
}
