import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:zapp/ans_button.dart';
import 'package:zapp/data/questions.dart';


class Question extends StatefulWidget {
  const Question({super.key,required this.onSelectAnswer,});
  final void Function(String answers) onSelectAnswer;


  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  var currentQuestionIndex=0;

void answerQuestion(String selectedAnswer){
  widget.onSelectAnswer(selectedAnswer);
  setState(() {
    //currentQuestionIndex=currentQuestionIndex + 1;
    currentQuestionIndex++;

  });

}

  @override
  Widget build(context) {

    final currentQuestion=questions[currentQuestionIndex];
    return SizedBox(
      width:double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          
          children: [
           Text(
            currentQuestion.text,
            style:GoogleFonts.dancingScript(
              color:Colors.amberAccent,
              fontSize: 24,
              fontWeight:FontWeight.bold,

            ),
            textAlign: TextAlign.center,
            ),
          const SizedBox(height: 30,),
          ...currentQuestion.getShuffledAnswer().map((answers){
            return AnswerButton(answerText:answers, 
            onTap:(){
              answerQuestion(answers);


            },
            );
          })    
        ],
        ),
      ),
    );
  }
}
