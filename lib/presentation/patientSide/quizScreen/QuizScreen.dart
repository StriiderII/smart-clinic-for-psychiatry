import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';


class QuizScreen extends StatefulWidget {
  QuizScreen(this.question, this.x, this.disorder, this.colors);
  List<String> question;
  final String disorder;
  final int x;
  final List<Color> colors;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child:
            Question(widget.question, widget.x, widget.disorder, widget.colors),
      ),
    );
  }
}

class Question extends StatefulWidget {
  Question(this.question, this.qno, this.disorder, this.colors);
  final List<String> question;
  final int qno;
  final String disorder;
  final List<Color> colors;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int i = 0;
  bool over = false;
  int ans = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: height / 2.5,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.colors),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: MyTheme.whiteColor,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    child: Text(

                      over == false ? 'Push Your Mental Boundaries' : 'Results',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 90),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height / 5.5,
              child: Container(
                height: height * 0.5,
                width: width / 1.2,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        over == false
                            ? 'Question no - ${i + 1}'
                            : '------ Conclusion ------',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height / 30),
                      Text(
                        over == false
                            ? widget.question[i]
                            : ans == widget.qno
                                ? "you are having chances of suffering through ${widget.disorder}"
                                : ans >= widget.qno / 2
                                    ? "You have moderate chances of suffering through ${widget.disorder}"
                                    : "You have very low chances of suffering through ${widget.disorder}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      over == true
                          ? Container(
                              child: CircularPercentIndicator(
                                radius: 80.0,
                                lineWidth: 13.0,
                                animation: true,
                                animationDuration: 600,
                                percent: ans == widget.qno
                                    ? 0.9
                                    : ans >= widget.qno / 2
                                        ? 0.6
                                        : 0.3,
                                center: new Text(
                                  ans == widget.qno
                                      ? "High Risk"
                                      : ans >= widget.qno / 2
                                          ? "Moderate Risk"
                                          : "Low Risk",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: ans == widget.qno
                                    ? Colors.red
                                    : ans >= widget.qno / 2
                                        ? Colors.orange
                                        : Colors.green,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 0.35 * height),
        over == false
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 0.36 * width,
                    height: 0.08 * height,
                    child: ElevatedButton(
                      onPressed: () {
                        ans++;
                        setState(() {
                          i++;
                          if (i > widget.qno - 1) {
                            over = true;
                            String risk = ans == widget.qno
                                ? "High"
                                : ans >= widget.qno / 2
                                    ? "Moderate"
                                    : "Low";
                          }
                        });
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white,fontSize: 24),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            widget.colors[0].withOpacity(0.7)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.36 * width,
                    height: 0.08 * height,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          i++;
                          if (i > widget.qno - 1) {
                            over = true;
                          }
                        });
                      },
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white,fontSize: 24),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            widget.colors[1].withOpacity(0.8)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : ans == widget.qno
                ? Text(
                    'Please focus on yourself and give your self some time to meditate and relax;',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
                : ans >= widget.qno / 2
                    ? Text(
                        'Keep meditating regularly and eat healthy.\nYou are just few days away from perfect mental health',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'Your health seems good enough.\nKeep it up!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
      ],
    );
  }
}
