import 'package:flutter/material.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/features/auth/data/models/register_input.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:provider/provider.dart';

class RegisterTextFormFields extends StatelessWidget {
  const RegisterTextFormFields({
    super.key,
    required this.cubit,
    required this.registerInput,
  });

  final RegisterCubit cubit;
  final RegisterInput registerInput;

  @override
  Widget build(BuildContext context) {
    var registerInputProvider = context.read<RegisterInput>();
    return Form(
      key: registerInputProvider.formKey,
      child: Column(
        spacing: 20,
        children: [
          CustomFormField(
            controller: registerInputProvider.userNameController,
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
            controller: registerInputProvider.emailController,
            hintText: 'name@example.com',
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
                  controller: registerInputProvider.passwordController,
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
                  controller: registerInputProvider.confirmPasswordController,
                  hintText: 'confirm',
                  type: TextInputType.visiblePassword,
                  isPassword: cubit.isPassword,
                  suffix: cubit.suffix,
                  suffixPressed: cubit.changePasswordVisibilty,
                  validation: (value) {
                    if (value !=
                        registerInputProvider.passwordController.text) {
                      return 'password didn\'t match';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          CustomFormField(
            controller: registerInputProvider.phoneController,
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
