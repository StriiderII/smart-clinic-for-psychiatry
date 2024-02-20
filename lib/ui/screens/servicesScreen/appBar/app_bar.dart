import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

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
              'User name',
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10.h,),
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