import 'package:flutter/material.dart';
import 'package:zapp/data/questions.dart';
import 'package:zapp/question.dart';
import 'package:zapp/start_screen.dart';
import 'package:zapp/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

enum Screen { startScreen, questionScreen, resultScreen }

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = Screen.startScreen;

  void switchScreen() {
    setState(() {
      activeScreen = Screen.questionScreen;
      selectedAnswer = []; // Clear previous answers
    });
  }

  void chooseAnswer(String answers) {
    selectedAnswer.add(answers);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = Screen.resultScreen;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = Screen.questionScreen;
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == Screen.questionScreen) {
      screenWidget = Question(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == Screen.resultScreen) {
      screenWidget = Result(
        chosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}