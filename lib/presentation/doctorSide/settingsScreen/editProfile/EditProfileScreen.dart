import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/editProfile/changePassword/ChangePasswordScreen.dart';


class EditProfileScreen extends StatefulWidget {


  const EditProfileScreen({super.key});
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/settings_page.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: MyTheme.whiteColor,
                        size: 40,
                      ),
                      onPressed: () {
                          Navigator.of(context).pop();
                        },
                    ),
                    SizedBox(width: 80.w),
                    Image.asset('assets/images/edit_profile_font.png'),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 80.r,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 15,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/edit_profile_icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Username',
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
                          hintStyle: TextStyle(fontSize: 13),
                          hintText: '@username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xff3660D9)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('First Name',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          width: 135.w,
                          height: 50.h,
                          child: TextField(
                            textAlign: TextAlign.start,
                            cursorHeight: 32.h,
                            cursorWidth: 1,
                            cursorColor: Color(0xff3660D9),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 13),
                              hintText: 'wick',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Color(0xff3660D9)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Last Name',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                          width: 135.w,
                          height: 50.h,
                          child: TextField(
                            textAlign: TextAlign.start,
                            cursorHeight: 32.h,
                            cursorWidth: 1,
                            cursorColor: Color(0xff3660D9),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 13),
                              hintText: 'jhon',
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
                          height: 20.h,
                        ),
                      ],
                    ),
                  ],
                ),
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
                      height: 20.h,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text('Phone Number',
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
                          hintStyle: TextStyle(fontSize: 13),
                          hintText: '@+20',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xff3660D9)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ),
                          );
                        },
                        child: Text(
                          'Change password',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 1,
                              decorationColor: MyTheme.blackColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: MyTheme.blackColor),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
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
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}