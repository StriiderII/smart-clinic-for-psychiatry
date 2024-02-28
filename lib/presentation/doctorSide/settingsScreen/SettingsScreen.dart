import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clinic_for_psychiatry/di/di.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/loginScreen/LoginScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/SettingsScreenViewModel.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/editProfile/EditProfileScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/language/LanguageScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/doctorSide/settingsScreen/theme/ThemeScreen.dart';


class SettingsScreenDoctor extends StatefulWidget {
  static const String routeName = 'settings screen_doctor';

  const SettingsScreenDoctor({super.key});
  @override
  _SettingsScreenDoctorState createState() => _SettingsScreenDoctorState();
}

class _SettingsScreenDoctorState extends State<SettingsScreenDoctor> {

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
          Positioned(
            top: 30,
            left: 112,
            child: Image.asset(
              'assets/images/settings_font.png',
              width: 180.w,
              height: 180.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSettingsButton(
                  title: 'Edit profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  indent: 20,
                  endIndent: 35,
                ),
                _buildSettingsButton(
                  title: 'Language',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LanguageScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  indent: 20,
                  endIndent: 35,
                ),
                _buildSettingsButton(
                  title: 'Theme',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThemeScreen(),
                      ),
                    );
                  },
                ),
                const Divider(
                  indent: 20,
                  endIndent: 35,
                ),
                _buildSettingsButton(
                  title: 'About',
                  onTap: () {},
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () async {

                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                    // Handle successful logout here (e.g., navigate to login)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 8,
                    padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Log out',
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

  Widget _buildSettingsButton(
      {required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24.sp),
          ),
          const Spacer(),
          const Icon(Icons.navigate_next),
        ],
      ),
      onTap: onTap,
    );
  }
}
