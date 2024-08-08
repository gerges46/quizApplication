import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizapplication/data/questions.dart';
import 'package:quizapplication/home.dart';
import 'package:quizapplication/question.dart';
import 'package:quizapplication/result.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<String> onSelectedAnswer = [];

  // to choose answer and correct
  void chooseAnswer(String answer) {
    //log(answer);

    onSelectedAnswer.add(answer);
    // check of i reach to last question

    if (onSelectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = Result(onSelectedAnswer,restart);
      });
    }
    log(onSelectedAnswer.toString());
  }

// function to restart exam

  void restart() {
    setState(() {
  onSelectedAnswer = [];
  activeScreen = HomePage(switchScreen);
});
  }

  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 250, 236, 214),
          Color(0xff7e7e72),
        ])),
        child: activeScreen,
      ),
    );
  }
}
