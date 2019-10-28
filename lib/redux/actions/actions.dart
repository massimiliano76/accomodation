import '../types.dart' as Constants;

class LoginAction {
  String id = Constants.LOGIN_ACTION;
}

class LogoutAction {
  String id = Constants.LOGOUT_ACTION;
}

class FinishedQuestions {
  String id = Constants.FINISHED_QUESTIONS;
}

class IncrementPageCounter {
  String id = Constants.INCREMENT_PAGE_COUNTER;
}

class AddToFavorite {
  AddToFavorite({this.payload});

  String id = Constants.ADD_TO_FAVORITE;
  int payload;
}

class RemoveToFavorite {
  RemoveToFavorite({this.payload});
  String id = Constants.REMOVE_TO_FAVORITE;
  int payload;
}
