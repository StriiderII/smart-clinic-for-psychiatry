import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum RegisterStatus { initial, loading, success, error }

class RegisterViewState {
  final RegisterStatus status;
  final String? errorMessage;

  RegisterViewState(this.status, {this.errorMessage});
}

class RegisterViewModel extends Cubit<RegisterViewState> {
  RegisterViewModel() : super(RegisterViewState(RegisterStatus.initial));

  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  late String verificationId;
  // bool validateCode = true;

  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();

  void signupWithEmailAndPassword() async {
    try {
      emit(RegisterViewState(RegisterStatus.loading));
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(RegisterViewState(RegisterStatus.success));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      emit(RegisterViewState(RegisterStatus.error, errorMessage: errorMessage));
    } catch (e) {
      emit(RegisterViewState(RegisterStatus.error, errorMessage: e.toString()));
    }
  }
}
