import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class PasswordBloc extends Bloc<String, PasswordState> {
  PasswordBloc() : super(PasswordInitial()) {
    on<String>((event, emit) {
      bool hasUpperCaseLetter = false;
      for (int i = 0; i < event.length; i++) {
        if (event[i] == event[i].toUpperCase()) {
          hasUpperCaseLetter = true;
        }
      }
      if (event.length < 6) {
        emit(PasswordLengthError());
      } else if (!hasUpperCaseLetter) {
        emit(PasswordCaseError());
      } else {
        emit(PasswordValid());
      }
    });
  }
}

abstract class PasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PasswordInitial extends PasswordState {}

class PasswordLengthError extends PasswordState {}

class PasswordCaseError extends PasswordState {}

class PasswordValid extends PasswordState {}
