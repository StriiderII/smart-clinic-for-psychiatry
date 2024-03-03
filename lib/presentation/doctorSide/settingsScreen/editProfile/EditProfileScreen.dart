import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_clinic_for_psychiatry/data/database/firebase/FireBaseUtils.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/dialogUtils/dialogUtils.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/imageFuncions/ImageFunctions.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/editProfile/EditProfileViewModel.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/editProfile/changePassword/ChangePasswordScreen.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = 'edit profile';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? pickedImage;
  late SharedPreferences _prefs;
  var viewModel = getIt<EditProfileViewModel>();
  String? userName; // Variable to store the user's name
  String? userPhone; // Variable to store the user's phone number
  bool editingProfile = false; // Flag to track if profile is being edited
  bool showSuccessMessage =
      false; // Flag to track if success message should be shown

  @override
  void initState() {
    super.initState();
    // Call the functions to get the user's information when the screen initializes
    _getUserName();
    _getPhone();
  }

  Future<void> _getUserName() async {
    // Check if a user is signed in
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return; // Handle the case where no user is signed in
    }

    final String uId = user.uid; // Use actual logic to get ID

    final name = await FirebaseUtils.getUserName(uId);
    setState(() {
      userName = name;
      // Log the retrieved name
    });
  }

  Future<void> _getPhone() async {
    // Check if a user is signed in
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return; // Handle the case where no user is signed in
    }

    final String uId = user.uid; // Use actual logic to get ID

    final phone = await FirebaseUtils.getPhone(uId);
    setState(() {
      userPhone = phone;
      // Log the retrieved phone number
    });
  }

  void updateUserInfo() {
    viewModel.updateUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileViewModel, EditProfileViewState>(
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
              DialogUtils.showMessage(context, state.message,
                  posActionName: 'Ok');
            }
          case LoadingState():
            {
              DialogUtils.showLoading(context, 'Loading..');
            }
          case EditProfileSuccessState():
            {
              setState(() {
                showSuccessMessage = true;
              });
              Future.delayed(const Duration(milliseconds: 1000), () {
                setState(() {
                  showSuccessMessage = false;
                });
              });

              // Fetch updated user information from Firebase
              _getUserName();
              _getPhone();
              break;
            }
          case InitialState():
        }
      },
      bloc: viewModel,
      child: Scaffold(
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
                    onTap: () async {
                      File? temp = await ImageFunctions.galleryPicker();
                      if (temp != null) {
                        pickedImage = temp;
                      }
                      setState(() {});
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 80.r,
                          backgroundImage: pickedImage == null
                              ? null
                              : FileImage(pickedImage!),
                          child: pickedImage == null
                              ? Icon(
                                  Icons.person,
                                  size: 80,
                                )
                              : null,
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
                    height: 70.h,
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Full Name',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 350.w,
                        height: 50.h,
                        child: editingProfile
                            ? TextFormField(
                                controller: viewModel.newNameController,
                                textAlign: TextAlign.start,
                                cursorHeight: 32.h,
                                cursorWidth: 1,
                                cursorColor: const Color(0xff3660D9),
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(fontSize: 13),
                                  hintText: 'full name',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xff3660D9)),
                                  ),
                                ),
                              )
                            : Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: MyTheme
                                        .primaryLight, // You can set the color of the border here
                                    width:
                                        1.0, // You can adjust the width of the border here
                                  ),
                                ),
                                child: Text(
                                  userName ?? '',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 35,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Phone Number',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        width: 350.w,
                        height: 50.h,
                        child: editingProfile
                            ? TextFormField(
                                controller: viewModel.newPhoneController,
                                textAlign: TextAlign.start,
                                cursorHeight: 32.h,
                                cursorWidth: 1,
                                cursorColor: const Color(0xff3660D9),
                                decoration: InputDecoration(
                                  hintStyle: const TextStyle(fontSize: 13),
                                  hintText: 'phone number',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xff3660D9)),
                                  ),
                                ),
                              )
                            : Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: MyTheme
                                        .primaryLight, // You can set the color of the border here
                                    width:
                                        1.0, // You can adjust the width of the border here
                                  ),
                                ),
                                child: Text(
                                  userPhone ?? '',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 10.h,
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
                                builder: (context) => const ChangePassword(),
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
                    height: 30.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (editingProfile) {
                        // Save changes and toggle back to view mode
                        updateUserInfo();
                        setState(() {
                          editingProfile = false;
                        });
                      } else {
                        // Toggle to editing mode
                        setState(() {
                          editingProfile = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          editingProfile ? Colors.green : MyTheme.primaryLight,
                      elevation: 8,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      editingProfile ? 'Save Changes' : 'Edit Profile',
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Show success message
                  if (showSuccessMessage)
                    AnimatedOpacity(
                      opacity: showSuccessMessage ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Profile updated successfully',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
