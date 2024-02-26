import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


enum LoginStatus { initial, loading, success, error }

class LoginViewState {
  final LoginStatus status;
  final String? errorMessage;

  LoginViewState(this.status, {this.errorMessage});
}


class LoginViewModel extends Cubit<LoginViewState> {
  LoginViewModel() : super(LoginViewState(LoginStatus.initial));

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;



   login() async {
      try {
        emit(LoginViewState(LoginStatus.loading));
        final credential = await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        emit(LoginViewState(LoginStatus.success));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-login-credentials') {
          emit(LoginViewState(LoginStatus.error, errorMessage: 'Invalid, please try again later'));
        }
      } catch (e) {
        emit(LoginViewState(LoginStatus.error, errorMessage: e.toString()));
      }

  }
}
