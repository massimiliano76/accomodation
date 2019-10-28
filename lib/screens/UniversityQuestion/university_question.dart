import 'package:easyhome/components/QuestionTemplate/question_template.dart';
import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/BudgetQuestion/budget_question.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

class UniversityQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) => () {
        if (store.state.pagePosition == 2) {
          store.dispatch(IncrementPageCounter());
        }
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: BudgetQuestion(),
          ),
        );
      },
      builder: (context, incrementCounter) => QuestionTemplate(
        data: Data.university,
        title: 'Dove studi?',
        onTap: incrementCounter,
      ),
    );
  }
}
