import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/customTextFormField/CustomTextFormField.dart';
import 'package:smart_clinic_for_psychiatry/ui/dialogUtils/dialogUtils.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/authentication/loginScreen/LoginScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/authentication/registerScreen/RegisterScreenViewModel.dart';
import 'package:animate_do/animate_do.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register screen';

  RegisterScreen({super.key});

  var viewModel = getIt<RegisterViewModel>();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterViewState>(
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
          case RegisterSuccessState():
            {
              DialogUtils.showMessage(
                  context,
                  'Registered Successfully\n',
                  posActionName: 'ok',
                 posAction: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  });
            }
          case InitialState():
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
                  BounceInDown(
                    child: Image.asset('assets/images/signup_font.png'),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  FadeInLeft(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '🎉 Welcome to our vibrant community of Smart Clinic For Psychiatry',
                          style: TextStyle(
                              fontSize: 24.sp,

                              fontWeight: FontWeight.w600,
                              color: MyTheme.whiteColor),
                        ),
                        Text(
                          'Feel free to Sign Up and join us on our exciting journey',
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
                  BounceInLeft(
                    child: CustomFormField(
                      label: 'Full Name',
                      hint: 'name',
                      controller: viewModel.nameController,
                      keyboardType: TextInputType.name,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                    ),
                  ),
                  BounceInLeft(
                    child: CustomFormField(
                      label: 'Email',
                      hint: 'email',
                      controller: viewModel.emailController,
                      keyboardType: TextInputType.emailAddress,
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
                  BounceInLeft(
                    child: CustomFormField(
                      label: 'Phone',
                      hint: 'phone',
                      controller: viewModel.phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter a valid phone';
                        }
                        if (text.length < 11) {
                          return 'Phone should be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  BounceInLeft(
                    child: CustomFormField(
                      label: 'Password',
                      hint: 'password',
                      controller: viewModel.passwordController,
                      keyboardType: TextInputType.text,
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
                  BounceInLeft(
                    child: CustomFormField(
                      label: 'Password verification',
                      hint: 'confirm password',
                      controller: viewModel.passwordVerificationController,
                      keyboardType: TextInputType.text,
                      secureText: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter a confirmation password';
                        }
                        if (text != viewModel.passwordController.text) {
                          return 'Password does not match!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: MyTheme.whiteColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              decorationColor: Colors.white,
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
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          createAccount();
                        },
                        child: const Text(
                          'Sign Up',
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
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState?.validate() == false) return;
    viewModel.createAccount();
  }
}
