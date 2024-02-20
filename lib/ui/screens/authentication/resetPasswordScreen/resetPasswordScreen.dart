import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/customTextFormField/CustomTextFormField.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/authentication/registerScreen/RegisterScreen.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = 'forgot password screen';

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryLight,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 200.h,
              ),
              BounceInDown(
                child: Image.asset('assets/images/reset_password_font.png'),
              ),
              SizedBox(
                height: 70.h,
              ),
              FadeInLeft(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Feel free to restore your password instantly with one button',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: MyTheme.whiteColor,
                      ),
                    ),
                    Text(
                      'Please enter your e-mail',
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
                  label: 'Email',
                  hint: 'Enter your Email',
                  // Provide the email controller
                  controller: TextEditingController(),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter a valid e-mail';
                    }
                    bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0.9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(text);
                    if (!emailValid) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Restored your password?',
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
                      'sign in',
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
              ),
              BounceInUp(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(MyTheme.backgroundButtonColor),
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

                    },
                    child: const Text(
                      'Send email',
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
    );
  }
}
