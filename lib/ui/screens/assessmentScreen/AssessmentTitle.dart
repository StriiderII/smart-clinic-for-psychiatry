import 'package:flutter/material.dart';
import 'package:smart_clinic_for_psychiatry/ui/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/assessmentScreen/Questions.dart';
import 'package:smart_clinic_for_psychiatry/ui/screens/quizScreen/QuizScreen.dart';

class AssessmentTile extends StatelessWidget {
  final String title;
  final List<String> questions;
  final List<Color> colors;

  const AssessmentTile({
    required this.title,
    required this.questions,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizScreen(questions, questions.length, title, colors),
          ),
        );
      },
      child: ListTile(
        title: Center(child: Text(title, style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: MyTheme.darkPinkColor
        ))),
        tileColor: MyTheme.backgroundButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: MyTheme.primaryLight, width: 1,style: BorderStyle.solid),
        ),
      ),
    );
  }
}