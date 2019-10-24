import '../store/store.dart';
import '../types.dart' as Constants;

AppState loginReducer(AppState prevState, dynamic action) {
  switch (action.id) {
    case Constants.LOGIN_ACTION:
      final newState = prevState;
      newState.isLogIn = true;
      return newState;
    case Constants.LOGOUT_ACTION:
      final newState = prevState;
      newState.isLogIn = false;
      return newState;
    default:
      return prevState;
  }
}
