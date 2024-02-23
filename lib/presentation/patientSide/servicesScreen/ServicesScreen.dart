import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/servicesScreen/appBar/app_bar.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/servicesScreen/emoji/emoj.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/servicesScreen/vitals/vitals.dart';


class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  static const String routeName = 'home_screen';

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add your custom app bar here
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 70,horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeMessage(),
              Text(
                'How are you feeling today ?',
                style: GoogleFonts.poppins(
                  color: Color(0xff371B34),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              Emoj(),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  print('amogus');
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset(
                    'assets/images/find_your_specialist_light.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Text(
                'Vitals',
                style: GoogleFonts.poppins(
                  fontSize: 30.sp,
                ),
              ),
              Vitals(),

            ],
          ),
        ),
      ),
    );
  }
}
