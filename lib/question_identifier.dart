import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber=questionIndex+1;
    return Container(
      width:30,
      height:30,
      alignment:Alignment.center,
      decoration: BoxDecoration(
  color: isCorrectAnswer
      ? const Color.fromARGB(255, 46, 219, 219)
      : const Color.fromARGB(255, 223, 110, 147),
  borderRadius: BorderRadius.circular(100),
),
      child:Text(
        questionNumber.toString(),
        style:const TextStyle(
          fontWeight:FontWeight.bold,
          color:Color.fromRGBO(9, 9, 9, 1.0),
        ),
      ),


    );
  }





}