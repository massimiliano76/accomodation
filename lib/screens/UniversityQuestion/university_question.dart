import 'package:easyhome/components/QuestionTemplate/question_template.dart';
import 'package:easyhome/screens/BudgetQuestion/budget_question.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';
import 'package:page_transition/page_transition.dart';

class UniversityQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Data();
    return QuestionTemplate(
      data: data.university,
      title: 'Dove studi?',
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: BudgetQuestion(),
          ),
        );
      },
    );
  }
}
