import 'package:easyhome/redux/reducers/finished_questions_reducer.dart';
import 'package:redux/redux.dart';

import 'login_reducer.dart';

final reducers = combineReducers([
  loginReducer,
  finishedQuestions,
]);
