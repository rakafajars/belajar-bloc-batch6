import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_username_event.dart';
part 'form_username_state.dart';

class FormUsernameBloc extends Bloc<FormUsernameEvent, FormUsernameState> {
  FormUsernameBloc() : super(FormUsernameInitial()) {
    on<FormUsernameEvent>((event, emit) {
      if (event is InputUsernameEvent) {
        if (event.query.isEmpty) {
          emit(
            const FormUsernameNotValid(
              message: 'Username tidak boleh kosong',
            ),
          );
        } else if (event.query.length < 2) {
          emit(
            const FormUsernameNotValid(
              message: 'Panjang username harus lebih dari 2',
            ),
          );
        } else {
          emit(
            FormUsernameValid(),
          );
        }
      } else if (event is InputPasswordEvent) {
        if (event.query.isEmpty) {
          emit(
            const FormPasswordNotValid(
              message: 'Password tidak boleh kosong',
            ),
          );
        } else if (event.query.length < 2) {
          emit(
            const FormPasswordNotValid(
              message: 'Panjang Password harus lebih dari 2',
            ),
          );
        } else {
          emit(
            FormPasswordValid(),
          );
        }
      }
    });
  }
}
