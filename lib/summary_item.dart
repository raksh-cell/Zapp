import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zapp/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = (itemData['user_answer'] as String)
            .trim()
            .toLowerCase() ==
        (itemData['correct_answer'] as String).trim().toLowerCase();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                itemData['user_answer'] as String,
                style: TextStyle(
                  color: isCorrectAnswer
                      ? Colors.greenAccent
                      : const Color.fromARGB(255, 211, 30, 30),
                ),
              ),
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}