import 'package:easyhome/components/QuestionTemplate/question_template.dart';
import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/UniversityQuestion/university_question.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

class CityQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) => () {
        if (store.state.pagePosition == 1) {
          store.dispatch(IncrementPageCounter());
        }
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: UniversityQuestion(),
          ),
        );
      },
      builder: (context, incrementCounter) => QuestionTemplate(
        data: Data.city,
        title: 'Dove cerchi appartamento?',
        onTap: incrementCounter,
      ),
    );
  }
}
