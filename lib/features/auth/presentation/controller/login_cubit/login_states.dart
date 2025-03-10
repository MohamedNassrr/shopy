abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {}

class PasswordVisibilityChangeStates extends LoginStates {}

class LoginFailureStates extends LoginStates {
  final String errMessage;

  LoginFailureStates(this.errMessage);
}

class UserLoginWithGoogleSuccess extends LoginStates {}

class UserLogoutWithGoogleSuccess extends LoginStates {}
