part of 'form_username_bloc.dart';

abstract class FormUsernameEvent extends Equatable {
  const FormUsernameEvent();
}

class InputUsernameEvent extends FormUsernameEvent {
  final String query;

  const InputUsernameEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}

class InputPasswordEvent extends FormUsernameEvent {
  final String query;

  const InputPasswordEvent({
    required this.query,
  });

  @override
  List<Object> get props => [query];
}
