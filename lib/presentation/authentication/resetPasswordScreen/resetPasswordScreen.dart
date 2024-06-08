import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/loginScreen/LoginScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/resetPasswordScreen/resetPasswordScreenViewModel.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/customTextFormField/CustomTextFormField.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/dialogUtils/dialogUtils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_clinic_for_psychiatry/provider/app_config_provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = 'forgot password screen';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var viewModel = getIt<ResetPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return BlocListener<ResetPasswordViewModel, ResetPasswordViewState>(
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
              DialogUtils.showMessage(context, AppLocalizations.of(context)!.we_have_sent_you_an_email,
                  posActionName: AppLocalizations.of(context)!.ok);
            }
          case LoadingState():
            {
              DialogUtils.showLoading(context, AppLocalizations.of(context)!.loading);
            }
          case ResetPasswordSuccessState():
            {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // Delayed navigation function
                  void delayedNavigation() {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    });
                  }

                  // Call the delayed navigation function
                  delayedNavigation();

                  return AlertDialog(
                    content: Text(
                      AppLocalizations.of(context)!.reset_password_successfully,
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
        backgroundColor: provider.isDarkMode()
            ? MyTheme.primaryDark
            : MyTheme.primaryLight,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                BounceInDown(
                  child: Text(AppLocalizations.of(context)!.reset_password,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: MyTheme.whiteColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                FadeInLeft(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.feel_free_to_restore_your_password_instantly_with_one_button,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: MyTheme.whiteColor,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.please_enter_your_email,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          color: MyTheme.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                BounceInUp(
                  child: CustomFormField(
                    label: AppLocalizations.of(context)!.email,
                    hint: AppLocalizations.of(context)!.enter_your_email,
                    // Provide the email controller
                    controller: viewModel.emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return AppLocalizations.of(context)!.please_enter_a_valid_e_mail;
                      }
                      bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0.9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(text);
                      if (!emailValid) {
                        return AppLocalizations.of(context)!.please_enter_a_valid_e_mail;
                      }
                      return null;
                    }, inputFormatters: [],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.restored_your_password,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: MyTheme.whiteColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.sign_in,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                          decorationColor: MyTheme.whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
                BounceInUp(
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child:ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyTheme.backgroundButtonColor),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        // Check if the email field is empty
                        if (viewModel.emailController.text.isEmpty) {
                          // Show dialog message for empty field
                          DialogUtils.showMessage(context, AppLocalizations.of(context)!.please_complete_the_missing_fields,
                              posActionName: AppLocalizations.of(context)!.ok);
                        } else {
                          // If email field is not empty, proceed with password reset
                          resetPassword();
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.send_email,
                        style: TextStyle(
                          color: provider.isDarkMode()
                              ? MyTheme.primaryDark
                              : MyTheme.primaryLight,
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

  void resetPassword() {
    viewModel.resetPassword();
  }
}
