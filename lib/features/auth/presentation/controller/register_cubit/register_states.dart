abstract class RegisterStates{}

class RegisterInitialStates extends RegisterStates{}

class RegisterLoadingStates extends RegisterStates{}

class RegisterSuccessStates extends RegisterStates{}

class RegisterPasswordVisibilityChangeStates extends RegisterStates{}

class RegisterFailureStates extends RegisterStates{
  final String errMessage;

  RegisterFailureStates(this.errMessage);
}