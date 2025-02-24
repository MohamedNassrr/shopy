import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomFormField(
            controller: cubit.emailController,
            hintText: 'email address',
            type: TextInputType.emailAddress,
            suffix: Icons.email_rounded,
            validation: (value) {
              if (value!.isEmpty) {
                return 'email address mustn\'t be empty';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomFormField(
            controller: cubit.passwordController,
            hintText: 'password',
            type: TextInputType.visiblePassword,
            isPassword: cubit.isPassword,
            validation: (value) {
              if (value!.isEmpty) {
                return 'password mustn\'t be empty';
              }
              return null;
            },
            suffix: cubit.suffix,
            suffixPressed: cubit.changePasswordVisibilty,
            onSubmit: (value) {
              if (cubit.formKey.currentState!.validate()) {
                cubit.userLogin(
                  email: cubit.emailController.text,
                  password: cubit.passwordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
