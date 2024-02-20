import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/authentication/loginScreen/LoginScreen.dart';

class UserRoleScreen extends StatefulWidget {
  static const String routeName = 'user role';

  @override
  _UserRoleScreenState createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
  int selectedContainerId = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.selectedIconBlueColor,
      body: Stack(
        children: [
          Center(
            child: BounceInUp( 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                    child: Image.asset(
                      'assets/images/YouAreA_font.png',
                      width: 250.0.w,
                      height: 250.0.h,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedContainerId != 0) {
                          selectedContainerId = 0;
                        }
                      });
                    },
                    child: Container(
                      width: 225.0.w,
                      height: 225.0.h,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: MyTheme.primaryLight, width: 4.h),
                        borderRadius: BorderRadius.circular(15.0),
                        color: selectedContainerId == 0
                            ? MyTheme.primaryLight
                            : Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 80.h,
                            left: 50.w,
                            child: Image.asset(
                              'assets/images/doctor_framed.png',
                              width: 110.w,
                              color: selectedContainerId == 0
                                  ? MyTheme.selectedIconBlueColor
                                  : null,
                            ),
                          ),
                          Positioned(
                            top: 40.h,
                            left: 5.w,
                            child: Image.asset(
                              'assets/images/doctor_font.png',
                              width: 200.w,
                              height: 20.h,
                              color: selectedContainerId == 0
                                  ? MyTheme.selectedIconBlueColor
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedContainerId != 1) {
                          selectedContainerId = 1;
                        }
                      });
                    },
                    child: Container(
                      width: 225.0.w,
                      height: 225.0.h,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: MyTheme.primaryLight, width: 4.h),
                        borderRadius: BorderRadius.circular(15.0),
                        color: selectedContainerId == 1
                            ? MyTheme.primaryLight
                            : Colors.transparent,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 80.h,
                            left: 50.w,
                            child: Image.asset(
                              'assets/images/patient_framed.png',
                              width: 110.w,
                              color: selectedContainerId == 1
                                  ? MyTheme.selectedIconBlueColor
                                  : null,
                            ),
                          ),
                          Positioned(
                            top: 40.h,
                            left: 5.w,
                            child: Image.asset(
                              'assets/images/patient_font.png',
                              width: 200.w,
                              height: 20.h,
                              color: selectedContainerId == 1
                                  ? MyTheme.selectedIconBlueColor
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 150.h),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 70.0.h,
            right: 40.0.w,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              },
              child: FadeInRight(
                child: Image.asset(
                  'assets/images/bottom_arrow.png',
                  width: 70.0.w,
                  height: 70.0.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
