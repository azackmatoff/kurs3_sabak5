import 'package:flutter/material.dart';
import 'package:kurs3_sabak5/expanded_text_button.dart';
import 'package:kurs3_sabak5/questions_brain.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> icons = <Widget>[];

  int count = 0;

  String questionText = 'No Questions';

  Icon correctIcon = Icon(
    Icons.check,
    color: Colors.green,
    size: 32.0,
  );
  Icon inCorrectIcon = Icon(
    Icons.close,
    color: Colors.red,
    size: 32.0,
  );

  @override
  void initState() {
    super.initState();
    print('initState========');
    questionText = QuestionsBrain().getQuestion();
  }

  // Scope, global
  // Scope, private
  void userAnswered(bool userAnswer) {
    bool _realAnswer = questionsBrain.getRealAnswer();

    if (userAnswer == _realAnswer) {
      // tuura
      icons.add(correctIcon);
    } else {
      // tuura emes
      icons.add(inCorrectIcon);
    }

    questionsBrain.getNext();
    questionText = questionsBrain.getQuestion();

    print('questionText at UI: $questionText');

    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build======== $count');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          right: 18.0,
          left: 18.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  questionText,
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            questionText == 'Аягына чыкты!'
                ? ExpandedTextButton(
                    buttonText: 'Кайрадан башта!',
                    buttonBgColor: Color(0xff4CAF51),
                    onPressed: () {
                      setState(() {
                        icons = <Widget>[];
                        questionText = questionsBrain.reset();
                      });
                    },
                  )
                : ExpandedTextButton(
                    buttonBgColor: Color(0xff4CAF51),
                    buttonText: 'Туура',
                    onPressed: () {
                      userAnswered(true);
                    },
                  ),
            questionText == 'Аягына чыкты!'
                ? SizedBox()
                : ExpandedTextButton(
                    buttonBgColor: Color(0xffF54336),
                    buttonText: 'Туура эмес',
                    onPressed: () => userAnswered(false),
                    //Ustunku  userAnswered(true) degendin kiska jolu
                  ),
            //Bular misal, method arkiluu dynamichniy widgetterdi kuruu
            // _buildExpandedButton(
            //   buttonBgColor: Color(0xff4CAF51),
            //   buttonText: 'Tuura',
            // ),
            // _buildExpandedButton(
            //   buttonBgColor: Color(0xffF54336),
            //   buttonText: 'Tuura emes',
            // ),
            // Widget arkiluu dinamichniy widgetterdi kuruu

            // Row(
            //   children: icons,
            // ), //Ikonkalardi bul jerge koshso bolot, je bolboso bottomNavigationBar-ga koshso bolot
            SizedBox(height: 60.0),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 58.0, right: 18.0, left: 18.0),
        child: Row(
          children: icons,
        ),
      ),
    );
  }

  Expanded _buildExpandedButton({Color buttonBgColor, String buttonText}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              buttonBgColor,
            ),
          ),
        ),
      ),
    );
  }
}

// DRY - Don't Repeat Yourself
//
