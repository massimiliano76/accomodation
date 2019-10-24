//import 'package:redux/redux.dart';

import 'package:easyhome/redux/reducers/animationReducer.dart';
import 'package:redux/redux.dart';

import 'login_reducer.dart';

final reducers = combineReducers([
  loginReducer,
  animationReducer,
]);
