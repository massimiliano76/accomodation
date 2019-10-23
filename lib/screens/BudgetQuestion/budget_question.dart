import 'package:easyhome/components/QuestionTemplate/question_template.dart';
import 'package:easyhome/screens/PreferencesQuestion/preferences_question.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';
import 'package:page_transition/page_transition.dart';

class BudgetQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Data();
    return QuestionTemplate(
      data: data.budget,
      title: 'Qual è il tuo budget?',
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: PreferencesQuestion(),
          ),
        );
      },
    );
  }
}
