// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_del_upd_bloc.dart';

abstract class AddDelUpdEvent extends Equatable {
  const AddDelUpdEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDelUpdEvent {
  final Post post;
  const AddPostEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class UpdatePostEvent extends AddDelUpdEvent {
  final Post post;
  const UpdatePostEvent({required this.post});
  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends AddDelUpdEvent {
  final int postId;
  const DeletePostEvent({required this.postId});
  @override
  List<Object> get props => [postId];
}
