// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitialState extends PostsState {}

class PostsLoadingState extends PostsState {}

class PostsSuccessState extends PostsState {
  final List<Post> post;
  const PostsSuccessState({required this.post});
  @override
  List<Object> get props => [post];
}

class PostsFailureState extends PostsState {
  final String message;
  const PostsFailureState({required this.message});
  @override
  List<Object> get props => [message];
}
