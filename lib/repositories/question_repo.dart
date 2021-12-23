import 'package:flutter/material.dart';
import 'package:kurs3_sabak5/services/question_services.dart';

class QuestionRepo {
  List<Widget> _icons = <Widget>[];

  List<Widget> get getIcons => _icons;

  String primer = 'Primer';

  String _questionText = 'No Questions';

  String get getQuestionText => _questionText;

  set setQuestionText(String val) {
    _questionText = val;
  }

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

  void initQuestionRepo() {
    _questionText = questionsServices.getQuestion();
  }

  void userAnswered(bool userAnswer) {
    bool _realAnswer = questionsServices.getRealAnswer();

    if (userAnswer == _realAnswer) {
      // tuura
      _icons.add(correctIcon);
    } else {
      // tuura emes
      _icons.add(inCorrectIcon);
    }

    questionsServices.getNext();
    _questionText = questionsServices.getQuestion();

    print('questionText at UI: $getQuestionText');
  }

  void reset() {
    _icons = <Widget>[];
    _questionText = questionsServices.reset();
  }
}

final QuestionRepo questionRepo = QuestionRepo();
