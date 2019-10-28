import 'package:easyhome/redux/store/store.dart';
import '../types.dart' as Constants;

AppState finishedQuestions(AppState prevState, dynamic action) {
  switch (action.id) {
    case Constants.INCREMENT_PAGE_COUNTER:
      final newState = prevState;
      newState.pagePosition++;
      return newState;
      break;
    case Constants.FINISHED_QUESTIONS:
      final newState = prevState;
      newState.hasFinished = true;
      return newState;
      break;
    default:
      return prevState;
  }
}
