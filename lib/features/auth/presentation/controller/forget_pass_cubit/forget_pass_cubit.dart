import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_shop_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_states.dart';

class ForgetPassCubit extends Cubit<ForgetPassStates> {
  ForgetPassCubit() : super(ForgetPassInitialStates());

  void changePassword({
    required String email,
  }) {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      emit(ForgetPassSuccessStates());
    } catch (e) {
      emit(ForgetPassFailureStates(e.toString()));
    }
  }
}
