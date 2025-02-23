abstract class ForgetPassStates{}

class ForgetPassInitialStates extends ForgetPassStates{}
class ForgetPassLoadingStates extends ForgetPassStates{}
class ForgetPassSuccessStates extends ForgetPassStates{}
class ForgetPassFailureStates extends ForgetPassStates{
  final String error;

  ForgetPassFailureStates(this.error);
}
class ChangePasswordVisibilityStates extends ForgetPassStates{}