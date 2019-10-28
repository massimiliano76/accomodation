import 'package:easyhome/components/QuestionTemplate/question_template.dart';
import 'package:easyhome/redux/actions/actions.dart';
import 'package:easyhome/redux/store/store.dart';
import 'package:easyhome/screens/RoomPage/room_page.dart';
import 'package:flutter/material.dart';
import 'package:easyhome/services/data.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:page_transition/page_transition.dart';

class PreferencesQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) => () {
        store.dispatch(FinishedQuestions());
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: RoomPage(),
          ),
        );
      },
      builder: (context, finishedQuestions) => QuestionTemplate(
        data: Data.preference,
        title: 'Cosa preferisci?',
        onTap: finishedQuestions,
      ),
    );
  }
}
