import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_states.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/register_text_form_fields.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterUserCreateSuccessStates) {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegisterTextFormFields(cubit: cubit),
                  CustomTextButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.userRegister(
                          name: cubit.userNameController.text,
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                          phone: cubit.phoneController.text,
                        );
                      }
                    },
                    isLoading: state is RegisterLoadingStates ? true : false,
                    text: 'Register',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
