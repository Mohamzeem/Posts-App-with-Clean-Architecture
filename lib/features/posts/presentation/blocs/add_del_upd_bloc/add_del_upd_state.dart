// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_del_upd_bloc.dart';

abstract class AddDelUpdState extends Equatable {
  const AddDelUpdState();

  @override
  List<Object> get props => [];
}

class AddDelUpdInitialState extends AddDelUpdState {}

class AddDelUpdLoadingState extends AddDelUpdState {}

class AddDelUpdSuccessState extends AddDelUpdState {
  final String successMessage;
  const AddDelUpdSuccessState({required this.successMessage});
  @override
  List<Object> get props => [successMessage];
}

class AddDelUpdFailureState extends AddDelUpdState {
  final String failureMessage;
  const AddDelUpdFailureState({required this.failureMessage});
  @override
  List<Object> get props => [failureMessage];
}
