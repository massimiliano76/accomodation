import '../store/store.dart';
import '../types.dart' as Constants;

AppState animationReducer(AppState prevState, dynamic action) {
  switch (action.id) {
    case Constants.CONTAINER_ANIMATION:
      print(action.animationValue);
      final newState = prevState;
      newState.animation['container'] = action.animationValue;
      return newState;
    default:
      return prevState;
  }
}
