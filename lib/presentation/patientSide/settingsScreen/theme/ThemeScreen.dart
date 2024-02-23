import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeScreen extends StatefulWidget {
  static const String routeName = 'theme screen';
  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  List<String> themes = ['Light', 'Dark'];
  String selectedTheme = '';
  String previousSelectedTheme = '';

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
            top: 88,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            top: 30,
            left: 110,
            child: Image.asset(
              'assets/images/theme_font.png',
              width: 180.w,
              height: 180.h,
            ),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: themes.length,
              itemBuilder: (context, index) {
                String language = themes[index];
                bool isSelected = language == selectedTheme;

                return Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            language,
                            style: TextStyle(fontSize: 24),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedTheme == language) {
                                  return;
                                }
                                previousSelectedTheme = selectedTheme;
                                selectedTheme = language;
                              });
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                color: isSelected ? Colors.green : Colors.white,
                              ),
                              child: isSelected
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 35,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
