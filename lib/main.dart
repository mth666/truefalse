import 'package:flutter/material.dart';
import 'logicPage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

LogicPage logicPage = LogicPage();
void main() {
  runApp(const TrueFalse());
}

class TrueFalse extends StatelessWidget {
  const TrueFalse({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuestionGround(),
          ),
        ),
      ),
    );
  }
}

class QuestionGround extends StatefulWidget {
  const QuestionGround({super.key});

  @override
  State<QuestionGround> createState() => _QuestionGroundState();
}

class _QuestionGroundState extends State<QuestionGround> {
  List<Widget> scoreTracker = [];

  void answerMarker(bool userAnswers) {
    bool correctAnswer = logicPage.getCorrectAnswers();
    if (userAnswers == correctAnswer) {
      setState(() {
        if (logicPage.userFinished() == true) {
          Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve Finished The Game :).',
          ).show();
          logicPage.restartGame();
          scoreTracker = [];
        } else {
          if (userAnswers == correctAnswer) {
            scoreTracker.add(Icon(
              Icons.check,
              color: Colors.green,
            ));
          } else {
            scoreTracker.add(Icon(
              Icons.close,
              color: Colors.red,
            ));
          }
          logicPage.anotherQuestion();
        }
      });
    }
  }

  var questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          //Main Questions to Display
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                logicPage.getQuestionTexts(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          //True Icon
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                answerMarker(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          //False Icon
          child: Padding(
            padding: EdgeInsets.all(15),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () {
                answerMarker(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreTracker,
        )
        //
      ],
    );
  }
}
