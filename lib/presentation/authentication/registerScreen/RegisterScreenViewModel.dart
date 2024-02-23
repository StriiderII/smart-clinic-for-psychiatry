import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/domain/usecase/RegisterUseCase.dart';
import 'package:smart_clinic_for_psychiatry/data/database/FirebaseUtils.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterViewState> {
  RegisterUseCase registerUseCase;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordVerificationController = TextEditingController();
  var roleController = TextEditingController();

  @factoryMethod
  RegisterViewModel(this.registerUseCase) : super(InitialState());

  void createAccount() async {
    try {
      emit(LoadingState());
      var user = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        passwordVerificationController.text,
        phoneController.text,
        roleController.text,
      );

      emit(RegisterSuccessState(user));
    } catch (e) {
      emit(ErrorState('Something went wrong'));
    }
  }
}

sealed class RegisterViewState {}

class InitialState extends RegisterViewState {}

class ErrorState extends RegisterViewState {
  String? message;
  ErrorState(this.message);
}

class LoadingState extends RegisterViewState {}

class RegisterSuccessState extends RegisterViewState {
  User? user;
  RegisterSuccessState(this.user);
}
