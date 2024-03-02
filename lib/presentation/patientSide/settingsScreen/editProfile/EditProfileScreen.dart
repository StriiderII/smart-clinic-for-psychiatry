import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/data/database/firebase/FireBaseUtils.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/dialogUtils/dialogUtils.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/settingsScreen/editProfile/EditProfileViewModel.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/settingsScreen/editProfile/changePassword/ChangePasswordScreen.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = 'edit profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var viewModel = getIt<EditProfileViewModel>();
  String? userName; // Variable to store the user's name
  String? userPhone; // Variable to store the user's phone number
  bool editingProfile = false; // Flag to track if profile is being edited
  bool showSuccessMessage = false; // Flag to track if success message should be shown

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
      print('No user signed in');
      return; // Handle the case where no user is signed in
    }

    final String uId = user.uid; // Use actual logic to get ID

    final name = await FirebaseUtils.getUserName(uId);
    setState(() {
      userName = name;
      print('Retrieved name: $userName'); // Log the retrieved name
    });
  }

  Future<void> _getPhone() async {
    // Check if a user is signed in
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('No user signed in');
      return; // Handle the case where no user is signed in
    }

    final String uId = user.uid; // Use actual logic to get ID

    final phone = await FirebaseUtils.getPhone(uId);
    setState(() {
      userPhone = phone;
      print('Retrieved phone: $userPhone'); // Log the retrieved phone number
    });
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
              DialogUtils.showMessage(context, state.message ?? "",
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
                    height: 50.h,
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
                      Container(
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
                            : Text(
                          userName ?? '',
                          style: TextStyle(fontSize: 24),
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
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Phone Number',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
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
                            : Text(
                          userPhone ?? '',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
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
                      backgroundColor: editingProfile ? Colors.green : MyTheme.primaryLight,
                      elevation: 8,
                      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
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
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(10),
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

  void updateUserInfo() {
    viewModel.updateUserInfo();
  }
}
