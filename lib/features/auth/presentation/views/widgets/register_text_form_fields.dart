import 'package:flutter/material.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/features/auth/data/models/register_input.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:online_shop_app/generated/l10n.dart';
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
            hintText: S.of(context).registerUserName,
            type: TextInputType.text,
            suffix: Icons.person,
            validation: (value) {
              if (value!.isEmpty) {
                return S.of(context).registerUserValid;
              }
              return null;
            },
          ),
          CustomFormField(
            controller: registerInputProvider.emailController,
            hintText: S.of(context).registerEmail,
            type: TextInputType.text,
            suffix: Icons.email_rounded,
            validation: (value) {
              if (value!.isEmpty) {
                return S.of(context).registerEmailValid;
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
                  hintText: S.of(context).registerPassword,
                  type: TextInputType.visiblePassword,
                  isPassword: cubit.isPassword,
                  suffix: cubit.suffix,
                  suffixPressed: cubit.changePasswordVisibilty,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).registerPasswordValid;
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomFormField(
                  controller: registerInputProvider.confirmPasswordController,
                  hintText: S.of(context).registerPasswordConfirm,
                  type: TextInputType.visiblePassword,
                  isPassword: cubit.isPassword,
                  suffix: cubit.suffix,
                  suffixPressed: cubit.changePasswordVisibilty,
                  validation: (value) {
                    if (value !=
                        registerInputProvider.passwordController.text) {
                      return S.of(context).registerPasswordConfirmValid;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          CustomFormField(
            controller: registerInputProvider.phoneController,
            hintText: S.of(context).registerPhone,
            type: TextInputType.phone,
            validation: (value) {
              if (value!.isEmpty) {
                return S.of(context).registerPhoneValid;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
