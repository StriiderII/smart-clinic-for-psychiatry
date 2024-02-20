import 'package:flutter/material.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/authentication/loginScreen/LoginScreen.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/introductionScreen/IntroductionScreen_1.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/introductionScreen/IntroductionScreen_2.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/introductionScreen/IntroductionScreen_3.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/userRoleScreen/UserRoleScreen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'OnBoarding screen';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text('Skip',
                    style: TextStyle(
                      color: MyTheme.whiteColor
                    )
                      ,),),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserRoleScreen();
                          }));
                        },
                        child: Text('done',style: TextStyle(
                            color: MyTheme.whiteColor
                        )),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('next',style: TextStyle(
                            color: MyTheme.whiteColor
                        )),
                      ),
              ],
            ),
            alignment: Alignment(0, 0.8),
          ),
        ],
      ),
    );
  }
}
