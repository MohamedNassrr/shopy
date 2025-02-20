import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibilty() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterPasswordVisibilityChangeStates());
  }
}
