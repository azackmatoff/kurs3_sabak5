import 'package:kurs3_sabak5/question.dart';

class QuestionsBrain {
  // funksiyalar

  int _index = 0; //Private variable, privatnyi peremennyi

  List<Question> questions = [
    Question(question: 'Бактен Өзгөнгө караштуубу?', answer: false), //0
    Question(question: 'Баткен районбу?', answer: false), //1
    Question(question: 'Баткен Кыргызстандабы?', answer: true), //2
  ];

  String getQuestion() {
    print(
        'questionsBrain getQuestion index: $_index and questions.length: ${questions.length}');
    if (questions.length == _index) {
      print('questionsBrain.index getQuestion null: $_index');
      return 'Аягына чыкты!';
    }

    print('questionsBrain.index getQuestion: $_index');
    return questions[_index].question;
  }

  bool getRealAnswer() {
    print('questionsBrain.index getRealAnswer: $_index');
    return questions[_index].answer;
  }

  void getNext() {
    _index++;

    print('questionsBrain.index: $_index');
  }

  String reset() {
    _index = 0;
    return getQuestion();
  }
}

final QuestionsBrain questionsBrain = QuestionsBrain();
