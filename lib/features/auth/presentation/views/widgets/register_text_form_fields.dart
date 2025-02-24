import 'package:flutter/material.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';

class RegisterTextFormFields extends StatelessWidget {
  const RegisterTextFormFields({
    super.key,
    required this.cubit,
  });

  final RegisterCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: 20,
        children: [
          CustomFormField(
            controller: cubit.userNameController,
            hintText: 'username',
            type: TextInputType.text,
            suffix: Icons.person,
            validation: (value) {
              if (value!.isEmpty) {
                return 'username mustn\'t be empty';
              }
              return null;
            },
          ),
          CustomFormField(
            controller: cubit.emailController,
            hintText: 'example@gmail.com',
            type: TextInputType.text,
            suffix: Icons.email_rounded,
            validation: (value) {
              if (value!.isEmpty) {
                return 'email mustn\'t be empty';
              }
              return null;
            },
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: CustomFormField(
                  controller: cubit.passwordController,
                  hintText: 'password',
                  type: TextInputType.visiblePassword,
                  isPassword: cubit.isPassword,
                  suffix: cubit.suffix,
                  suffixPressed: cubit.changePasswordVisibilty,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'password mustn\'t be empty';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomFormField(
                  controller: cubit.confirmPasswordController,
                  hintText: 'confirm',
                  type: TextInputType.visiblePassword,
                  isPassword: cubit.isPassword,
                  suffix: cubit.suffix,
                  suffixPressed: cubit.changePasswordVisibilty,
                  validation: (value) {
                    if (value != cubit.passwordController.text) {
                      return 'password didn\'t match';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          CustomFormField(
            controller: cubit.phoneController,
            hintText: '01234567890',
            type: TextInputType.phone,
            validation: (value) {
              if (value!.isEmpty) {
                return 'phone mustn\'t be empty';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
