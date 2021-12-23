import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kurs3_sabak5/widgets/expanded_text_button.dart';
import 'package:kurs3_sabak5/repositories/question_repo.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    super.initState();

    /// setter [set] jana getter [get] misaldary
    /// oshondoy ele [private] jana [private] emes misaldar
    log('ozgoruudon murun questionRepo.primer ===>> ${questionRepo.primer}');
    log('ozgoruudon murun questionRepo.getQuestionText ===>> ${questionRepo.getQuestionText}');

    /// [questionRepo.primer] primer [private] emes oshol sebepten sirttan
    /// ozgorto aldik
    questionRepo.primer = 'Primer emes';
    questionRepo.setQuestionText = 'asda';

    log('ozgoruudon kiyin questionRepo.getQuestionText ===>> ${questionRepo.getQuestionText}');
    log('ozgoruudon kiyin questionRepo.primer ===>> ${questionRepo.primer}');

    questionRepo.initQuestionRepo();
  }

  void userAnswered(bool answer) {
    questionRepo.userAnswered(answer);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  questionRepo.getQuestionText,
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            questionRepo.getQuestionText == 'Аягына чыкты!'
                ? ExpandedTextButton(
                    buttonText: 'Кайрадан башта!',
                    buttonBgColor: Color(0xff4CAF51),
                    onPressed: () {
                      questionRepo.reset();
                      setState(() {});
                    },
                  )
                : ExpandedTextButton(
                    buttonBgColor: Color(0xff4CAF51),
                    buttonText: 'Туура',
                    onPressed: () {
                      userAnswered(true);
                    },
                  ),
            questionRepo.getQuestionText == 'Аягына чыкты!'
                ? SizedBox()
                : ExpandedTextButton(
                    buttonBgColor: Color(0xffF54336),
                    buttonText: 'Туура эмес',
                    onPressed: () => userAnswered(false),
                    //Ustunku  userAnswered(true) degendin kiska jolu
                  ),
            SizedBox(height: 60.0),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 58.0, right: 18.0, left: 18.0),
        child: Row(
          children: questionRepo.getIcons,
        ),
      ),
    );
  }
}
