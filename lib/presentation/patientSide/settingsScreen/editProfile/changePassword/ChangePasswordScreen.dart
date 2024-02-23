import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';


class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Email',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      width: 350.w,
                      height: 50.h,
                      child: TextField(
                        textAlign: TextAlign.start,
                        cursorHeight: 32.h,
                        cursorWidth: 1,
                        cursorColor: Color(0xff3660D9),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffDBE4FF),
                          hintStyle: TextStyle(fontSize: 13),
                          hintText: '@username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Current Password',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      width: 350.w,
                      height: 50.h,
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.start,
                        cursorHeight: 32.h,
                        cursorWidth: 1,
                        cursorColor: Color(0xff3660D9),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffDBE4FF),
                          hintStyle: TextStyle(fontSize: 13),
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('New Password',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      width: 350.w,
                      height: 50.h,
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.start,
                        cursorHeight: 32.h,
                        cursorWidth: 1,
                        cursorColor: Color(0xff3660D9),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffDBE4FF),
                          hintStyle: TextStyle(fontSize: 13),
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Confirm Password',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      width: 350.w,
                      height: 50.h,
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.start,
                        cursorHeight: 32.h,
                        cursorWidth: 1,
                        cursorColor: Color(0xff3660D9),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffDBE4FF),
                          hintStyle: TextStyle(fontSize: 13),
                          hintText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
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
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MyTheme.primaryLight,
                elevation: 8,
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
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
    );
  }
}
