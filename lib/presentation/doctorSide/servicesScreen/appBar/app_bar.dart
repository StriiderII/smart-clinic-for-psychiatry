import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_clinic_for_psychiatry/data/database/firebase/FireBaseUtils.dart';

class WelcomeMessage extends StatefulWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  State<WelcomeMessage> createState() => _WelcomeMessageState();
}

class _WelcomeMessageState extends State<WelcomeMessage> {
  String? _userName;

  @override
  void initState() {
    super.initState();
    _getUserName();
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
      _userName = name;
      print('Retrieved name: $_userName'); // Log the retrieved name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning,',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Doctor ${_userName}' ?? 'User name', // Use retrieved name or default
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Icon(Icons.notifications_none_outlined, size: 30.sp),
            SizedBox(width: 10.w),
            CircleAvatar(
              backgroundColor: Colors.cyan,
              // PROFILE PIC INPUT
            ),
          ],
        ),
      ],
    );
  }
}