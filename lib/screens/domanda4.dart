import 'package:easyhome/components/QuestionTemplate/question_template.dart';
import 'package:easyhome/screens/how_works.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';
import 'package:page_transition/page_transition.dart';

class Domanda4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Data();
    return QuestionTemplate(
      data: data.preference,
      title: 'Cosa preferisci?',
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: HowWorks(),
          ),
        );
      },
    );
  }
}
