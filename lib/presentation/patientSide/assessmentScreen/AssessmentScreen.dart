import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/assessmentScreen/AssessmentTitle.dart';
import 'package:smart_clinic_for_psychiatry/presentation/patientSide/assessmentScreen/Questions.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  static const String routeName = 'AssessmentScreen';

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  late Future<void> _loadingData;

  @override
  void initState() {
    super.initState();
    _loadingData = _loadData();
  }

  Future<void> _loadData() async {
    // Simulate loading data here if necessary
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _loadingData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryLight,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return _buildScreenContent();
          }
        },
      ),
    );
  }

  Widget _buildScreenContent() {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: 0.90 * MediaQuery.of(context).size.width,
                    child: FadeInLeft(
                      child: Image(
                        image: AssetImage('assets/images/assessment.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Text(
                    'Choose self-assessment test based on the following disorders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: MyTheme.primaryLight,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  AssessmentTile(
                    title: 'Depression',
                    questions: DepressionQuestions.questions,
                    colors: [MyTheme.primaryLight, MyTheme.backgroundButtonColor],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  AssessmentTile(
                    title: 'Anxiety',
                    questions: AnxietyQuestions.questions,
                    colors: [MyTheme.primaryLight, MyTheme.backgroundButtonColor],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  AssessmentTile(
                    title: 'PTSD',
                    questions: PTSDQuestions.questions,
                    colors: [MyTheme.primaryLight, MyTheme.backgroundButtonColor],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  AssessmentTile(
                    title: 'Schizophrenia',
                    questions: SchizophreniaQuestions.questions,
                    colors: [MyTheme.primaryLight, MyTheme.backgroundButtonColor],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  AssessmentTile(
                    title: 'Addiction',
                    questions: AddictionQuestions.questions,
                    colors: [MyTheme.primaryLight, MyTheme.backgroundButtonColor],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 80),
      child: Row(
        children: [
          SizedBox(
            width: 5.w,
          ),
          Image.asset('assets/images/assessment_font.png'),
        ],
      ),
    );
  }
}
