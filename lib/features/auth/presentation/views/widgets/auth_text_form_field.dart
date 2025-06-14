import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/features/auth/data/models/login_input.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';

class AuthTextFormField extends StatelessWidget {
  final LoginInput loginInput;
  const AuthTextFormField({super.key, required this.loginInput});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    var loginInputProvider = context.read<LoginInput>();
    return Form(
      key: context.read<LoginInput>().formKey,
      child: Column(
        children: [
          CustomFormField(
            controller:  loginInputProvider.emailController,
            hintText: S.of(context).emailForm,
            type: TextInputType.emailAddress,
            suffix: Icons.email_rounded,
            validation: (value) {
              if (value!.isEmpty) {
                return S.of(context).emailValidation;
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomFormField(
            controller: loginInputProvider.passwordController,
            hintText: S.of(context).passwordForm,
            type: TextInputType.visiblePassword,
            isPassword: cubit.isPassword,
            validation: (value) {
              if (value!.isEmpty) {
                return S.of(context).passwordValidation;
              }
              return null;
            },
            suffix: cubit.suffix,
            suffixPressed: cubit.changePasswordVisibilty,
            onSubmit: (value) {
              if (loginInputProvider.formKey.currentState!.validate()) {
                cubit.userLogin(
                  email:loginInputProvider.emailController.text,
                  password: loginInputProvider.passwordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
