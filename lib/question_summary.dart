import 'package:flutter/material.dart';
import 'package:zapp/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: summaryData.asMap().entries.map((entry) {
          final index = entry.key;
          final data = entry.value;
          return Column(
            children: [
              SummaryItem(data),
              SizedBox(
                height: index == 0 ? 30 : 15, // 30 units after first SummaryItem, 15 units after others
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}