import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:email_validator/email_validator.dart';

class EmailBloc extends Bloc<String, EmailState> {
  EmailBloc() : super(EmailInitial()) {
    on<String>((event, emit) {
      if (event.isEmpty) {
        emit(EmailEmpty());
      } else if (!EmailValidator.validate(event)) {
        emit(EmailInvalid());
      } else {
        emit(EmailValid());
      }
    });
  }
}

abstract class EmailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmailInitial extends EmailState {}

class EmailEmpty extends EmailState {}

class EmailInvalid extends EmailState {}

class EmailValid extends EmailState {}
