import 'package:flutter/material.dart';
import 'package:kurs3_sabak5/question_page.dart';
import 'package:kurs3_sabak5/questions_brain.dart';

import 'home_view.dart';

//final QuestionsBrain questionsBrain = QuestionsBrain(); //Global variable

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff212121),
      ),
      home: QuestionPage(),
    );
  }
}
