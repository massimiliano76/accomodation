import '../types.dart' as Constants;

class LoginAction {
  String id = Constants.LOGIN_ACTION;
}

class LogoutAction {
  String id = Constants.LOGOUT_ACTION;
}

class ContainerAnimation {
  ContainerAnimation({this.animationValue});

  String id = Constants.CONTAINER_ANIMATION;
  double animationValue = 0;
}
