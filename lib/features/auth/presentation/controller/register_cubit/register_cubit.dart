import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/features/auth/data/models/user_register_model.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState>  formKey = GlobalKey<FormState>();

  RegisterCubit() : super(RegisterInitialStates());

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingStates());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint(value.user!.email);
      debugPrint(value.user!.uid);
      createUser(
        name: name,
        email: email,
        uId: value.user!.uid,
        phone: phone,
      );
      emit(RegisterSuccessStates());
    }).catchError((error) {
      log(error.toString());
      emit(RegisterFailureStates(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String uId,
    required String phone,
  }) {
    UserRegisterModel model = UserRegisterModel(
      email: email,
      name: name,
      uId: uId,
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(
          model.toMap(),
        )
        .then((value) {
      emit(RegisterUserCreateSuccessStates());
    }).catchError((error) {
      emit(
        RegisterUserCreateFailureStates(
          error.toString(),
        ),
      );
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibilty() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterPasswordVisibilityChangeStates());
  }
}
