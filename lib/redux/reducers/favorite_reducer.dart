import 'package:easyhome/redux/store/store.dart';
import '../types.dart' as Constants;

AppState favoriteReducer(AppState prevState, dynamic action) {
  switch (action.id) {
    case Constants.ADD_TO_FAVORITE:
      final newState = prevState;
      newState.favorite[action.payload] = true;
      return newState;
      break;
    case Constants.REMOVE_TO_FAVORITE:
      final newState = prevState;
      newState.favorite[action.payload] = false;
      return newState;
      break;
    default:
      return prevState;
  }
}
