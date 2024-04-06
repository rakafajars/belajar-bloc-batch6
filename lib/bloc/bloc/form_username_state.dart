part of 'form_username_bloc.dart';

sealed class FormUsernameState extends Equatable {
  const FormUsernameState();

  @override
  List<Object> get props => [];
}

class FormUsernameInitial extends FormUsernameState {}

class FormUsernameValid extends FormUsernameState {}

class FormUsernameNotValid extends FormUsernameState {
  final String message;

  const FormUsernameNotValid({required this.message});

  @override
  List<Object> get props => [message];
}

class FormPasswordValid extends FormUsernameState {}

class FormPasswordNotValid extends FormUsernameState {
  final String message;

  const FormPasswordNotValid({required this.message});

  @override
  List<Object> get props => [message];
}
