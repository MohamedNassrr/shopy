abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {}

class RegisterFailureStates extends RegisterStates {
  final String errMessage;

  RegisterFailureStates(this.errMessage);
}

class RegisterUserCreateSuccessStates extends RegisterStates {}

class RegisterUserCreateFailureStates extends RegisterStates {
  final String errMessage;

  RegisterUserCreateFailureStates(this.errMessage);
}

class RegisterPasswordVisibilityChangeStates extends RegisterStates {}
