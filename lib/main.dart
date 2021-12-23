import 'package:flutter/material.dart';
import 'package:kurs3_sabak5/pages/question_page.dart';

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
      home: const QuestionPage(),
    );
  }
}
