/*
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/customTextFormField/CustomTextFormField.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/dialogUtils/dialogUtils.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/authentication/loginScreen/LoginScreenViewModel.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/authentication/registerScreen/RegisterScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/homeScreen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login screen';
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginViewState>(
      listenWhen: (old, newState) {
        if (old is LoadingState && newState is! LoadingState) {
          DialogUtils.hideLoading(context);
        }
        if (newState is InitialState) return false;
        return true;
      },
      listener: (context, state) {
        switch (state) {
          case ErrorState():
            {
              DialogUtils.showMessage(context, state.message ?? "",
                  posActionName: 'Ok');
            }
          case LoadingState():
            {
              DialogUtils.showLoading(context, 'Loading..');
            }
          case LoginSuccessState():
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logged In Successfully'),
                    content: Text('Logged In Successfully\n${state.user.email}'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, HomeScreen.routeName);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
              break;
            }

          case InitialState():
        }
      },
      bloc: viewModel,
      child: Scaffold(
        backgroundColor: MyTheme.primaryLight,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 70.h,
                ),
                BounceInDown(
                  child: Image.asset('assets/images/signin_font.png'),
                ),
                SizedBox(
                  height: 70.h,
                ),
                FadeInLeft(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back To Smart Clinic For Psychiatry',
                        style: TextStyle(
                            fontSize: 24.sp,

                            fontWeight: FontWeight.w600,
                            color: MyTheme.whiteColor),
                      ),
                      Text(
                        'Please sign in with your e-mail',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: MyTheme.whiteColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                BounceInUp(
                  child: CustomFormField(
                    label: 'Email',
                    hint: 'Enter your Email',
                    controller: viewModel.emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter a valid e-mail';
                      }
                      bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0.9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                BounceInUp(
                  child: CustomFormField(
                    label: 'Password',
                    hint: 'Enter your Password',
                    controller: viewModel.passwordController,
                    secureText: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter a valid password';
                      }
                      if (text.length < 6) {
                        return 'Password should be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.whiteColor),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterScreen.routeName);
                      },
                      child: Text(
                        'sign up',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            decorationColor: MyTheme.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: MyTheme.whiteColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.whiteColor),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'reset password',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            decorationColor: MyTheme.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: MyTheme.whiteColor),
                      ),
                    ),
                  ],
                ),
                BounceInUp(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyTheme.backgroundButtonColor),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(vertical: 12),
                        ),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        login();
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xff3660D9),
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    viewModel.login();
  }
}*/
