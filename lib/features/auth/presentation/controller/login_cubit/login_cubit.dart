import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/core/utils/google_auth_services.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final GoogleAuthService authService;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginCubit(this.authService) : super(LoginInitialStates());

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingStates());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(LoginSuccessStates());
      debugPrint('uid: ${value.user!.uid}');
      debugPrint('email: ${value.user!.email}');
      debugPrint('is verified: ${value.user!.emailVerified}');
    }).catchError((error) {
      emit(LoginFailureStates(error.toString()));
      log(error.toString());
    });
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    await authService.signInWithGoogle();
    emit(UserLoginWithGoogleSuccess());
    debugPrint(authService.auth.currentUser!.email);
    debugPrint(authService.auth.currentUser!.uid);
    debugPrint(authService.auth.currentUser!.emailVerified.toString());
  }

  // Sign out
  Future<void> signOut() async {
    await authService.signOut();
    emit(UserLogoutWithGoogleSuccess());
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibilty() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(PasswordVisibilityChangeStates());
  }
}
