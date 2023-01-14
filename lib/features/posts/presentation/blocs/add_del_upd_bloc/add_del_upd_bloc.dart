// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/features/posts/domain/usecases/add_post.dart';
import 'package:posts/features/posts/domain/usecases/delete_post.dart';
import 'package:posts/features/posts/domain/usecases/update_post.dart';
import '../../../../../core/strings/app_failures.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/strings/app_messages.dart';

part 'add_del_upd_event.dart';
part 'add_del_upd_state.dart';

class AddDelUpdBloc extends Bloc<AddDelUpdEvent, AddDelUpdState> {
  final AddPostUseCase addPostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  final DeletePostUseCase deletePostUseCase;
  AddDelUpdBloc(
      this.addPostUseCase, this.updatePostUseCase, this.deletePostUseCase)
      : super(AddDelUpdInitialState()) {
    on<AddDelUpdEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(AddDelUpdLoadingState());
        final failureOrDone = await addPostUseCase(event.post);
        emit(_failureOrDoneState(
            failureOrDone, AppMessages.ADD_SUCCESS_MESSAGE));
      } else if (event is UpdatePostEvent) {
        emit(AddDelUpdLoadingState());
        final failureOrDone = await updatePostUseCase(event.post);
        emit(_failureOrDoneState(
            failureOrDone, AppMessages.UPDATE_SUCCESS_MESSAGE));
      } else if (event is DeletePostEvent) {
        emit(AddDelUpdLoadingState());
        final failureOrDone = await deletePostUseCase(event.postId);
        emit(_failureOrDoneState(
            failureOrDone, AppMessages.DELETE_SUCCESS_MESSAGE));
      }
    });
  }

  AddDelUpdState _failureOrDoneState(Either<Failure, Unit> either, message) {
    return either.fold(
        (failure) =>
            AddDelUpdFailureState(failureMessage: _failureMessage(failure)),
        (r) => AddDelUpdSuccessState(successMessage: message));
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
