import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Vitals extends StatelessWidget {
  final List<String> imagePath = [
    'assets/images/heart_rate.png',
    'assets/images/systolic.png',
    'assets/images/diastolic.png',
    'assets/images/steps.png',
    'assets/images/blood_oxygen.png',
    'assets/images/temp.png',
  ];

  final List<String> imageTexts = [
    '20',
    '30',
    '34',
    '100',
    '300',
    '120',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              childAspectRatio: 1.3,
            ),
            itemCount: imagePath.length,
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: Stack(
                  children: [
                    Image.asset(
                      imagePath[index],
                      width: 300.w,
                      height: 300.h,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 50, top: 8),
                      child: Text(
                        imageTexts[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
