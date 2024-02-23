import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
  static const String routeName = 'language screen';
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> languages = ['Arabic', 'English'];
  String selectedLanguage = '';
  String previousSelectedLanguage = '';

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
              'assets/images/language_font.png',
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
              itemCount: languages.length,
              itemBuilder: (context, index) {
                String language = languages[index];
                bool isSelected = language == selectedLanguage;

                return Column(
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Text(
                            language,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedLanguage == language) {
                                  return;
                                }
                                previousSelectedLanguage = selectedLanguage;
                                selectedLanguage = language;
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
                      onTap: () {

                      },
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
