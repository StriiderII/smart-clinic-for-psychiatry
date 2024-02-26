import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/data/database/variables.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/loginScreen/login_controller.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/registerScreen/RegisterScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/customTextFormField/CustomTextFormField.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/dialogUtils/dialogUtils.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/homeScreen/HomeScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/homeScreen/HomeScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/userRoleScreen/selection/model/selection_model.dart';
import 'package:smart_clinic_for_psychiatry/presentation/userRoleScreen/selection/view/selection_view.dart';
import 'package:smart_clinic_for_psychiatry/domain/model/authenticationModel/UserAuthenticationModel.dart'
as auth;

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = LoginViewModel();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginViewState>(
      listener: (context, state) {
        if (state.status == LoginStatus.loading) {
          DialogUtils.showLoading(context, 'Loading..');
        } else {
          DialogUtils.hideLoading(context);
        }
        if (state.status == LoginStatus.error) {
          DialogUtils.showMessage(context, state.errorMessage ?? "", posActionName: 'Ok');
        }
        if (state.status == LoginStatus.success) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      if (userType == Selection.patient) {
                        return HomeScreen();
                      } else if (userType == Selection.doctor) {
                        return HomeScreenDoctor();
                      } else {
                        // Handle other user types if necessary
                        return SelectionView();
                      }
                    },
                  ),
                );
              });
              return AlertDialog(
                title: const Text('Logged In Successfully'),
              );
            },
          );
        }
      },
      bloc: viewModel,
      child: Scaffold(
        backgroundColor: MyTheme.primaryLight,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Image.asset('assets/images/signin_font.png'),
                  SizedBox(
                    height: 70.h,
                  ),
                  Column(
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
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomFormField(
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
                  CustomFormField(
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
                  userType == Selection.patient
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.whiteColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RegisterScreen.routeName,
                          );
                        },
                        child: Text(
                          'sign up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            decorationColor: MyTheme.whiteColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: MyTheme.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  )
                      : const SizedBox(),
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
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyTheme.backgroundButtonColor),
                        padding:
                        MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      onPressed: ()  {
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == false) return;
    viewModel.login();
  }
}
