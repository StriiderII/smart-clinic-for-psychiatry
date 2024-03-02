import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/dialogUtils/dialogUtils.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/settingsScreen/editProfile/changePassword/ChangePasswordViewModel.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var viewModel = getIt<ChangePasswordViewModel>();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordViewModel, ChangePasswordViewState>(
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
          case ChangePasswordSuccessState():
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // Delayed navigation function
                  void delayedNavigation() {
                    Future.delayed(const Duration(seconds: 1), () {});
                  }

                  // Call the delayed navigation function
                  delayedNavigation();

                  return const AlertDialog(
                    content: Text(
                      'password changed successfully',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              );
            }

          case InitialState():
        }
      },
      bloc: viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: MyTheme.primaryLight,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: 55.w),
                  Image.asset('assets/images/change_password_font.png'),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Email',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 350.w,
                        height: 50.h,
                        child: TextFormField(
                          controller: viewModel.currentEmailController,
                          textAlign: TextAlign.start,
                          cursorHeight: 32.h,
                          cursorWidth: 1,
                          cursorColor: const Color(0xff3660D9),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffDBE4FF),
                            hintStyle: const TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(
                                      0xff3660D9)), // Border color when focused
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                  buildPasswordTextField(
                      'Current Password',
                      viewModel.currentPasswordController,
                      _obscureCurrentPassword,
                          () {
                        setState(() {
                          _obscureCurrentPassword = !_obscureCurrentPassword;
                        });
                      }),
                  buildPasswordTextField(
                      'New Password',
                      viewModel.newPasswordController,
                      _obscureNewPassword,
                          () {
                        setState(() {
                          _obscureNewPassword = !_obscureNewPassword;
                        });
                      }),
                  buildPasswordTextField(
                      'Confirm Password',
                      viewModel.confirmPasswordController,
                      _obscureConfirmPassword,
                          () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              ElevatedButton(
                onPressed: () {
                  changePassword();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.primaryLight,
                  elevation: 8,
                  padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save changes',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(String label, TextEditingController controller, bool obscureText, VoidCallback onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 350.w,
          height: 50.h,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            textAlign: TextAlign.start,
            cursorHeight: 32.h,
            cursorWidth: 1,
            cursorColor: const Color(0xff3660D9),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffDBE4FF),
              hintStyle: const TextStyle(fontSize: 13),
              hintText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color(
                        0xff3660D9)), // Border color when focused
              ),
              suffixIcon: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }

  void changePassword() {
    viewModel.changePassword();
  }
}
