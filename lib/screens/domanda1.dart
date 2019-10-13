import 'package:easyhome/components/QuestionTemplate/question_template.dart';
import 'package:easyhome/screens/domanda2.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';
import 'package:page_transition/page_transition.dart';

class Domanda1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Data();
    return QuestionTemplate(
      data: data.city,
      title: 'Dove cerchi appartamento?',
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: Domanda2(),
          ),
        );
      },
    );
  }
}
