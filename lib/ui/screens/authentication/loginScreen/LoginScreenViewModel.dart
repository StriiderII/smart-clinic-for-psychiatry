import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_clinic_for_psychiatry/domain/usecase/LoginUseCase.dart';

@injectable
class LoginViewModel extends Cubit<LoginViewState>{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginUseCase loginUseCase;
  @factoryMethod LoginViewModel(this.loginUseCase):super(InitialState());

  void login() async {
    try {
      emit(LoadingState());
      var user = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      if(user == null){
        emit(ErrorState('Something went wrong'));
      }
      else {
        emit(LoginSuccessState(user));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}


sealed class LoginViewState{}
class InitialState extends LoginViewState{}
class ErrorState extends LoginViewState {
  String? message;
  ErrorState(this.message);
}

class LoadingState extends LoginViewState {}

class LoginSuccessState extends LoginViewState {
  User user;
  LoginSuccessState(this.user);
}
