import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/data/models/register_input.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_states.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/register_text_form_fields.dart';
import 'package:online_shop_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final registerInput = RegisterInput();

    return Provider.value(
      value: registerInput,
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterUserCreateSuccessStates) {
            GoRouter.of(context).pushReplacement(AppRouter.rLoginView);
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<RegisterCubit>(context);
          var registerInputProvider = context.read<RegisterInput>();
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Image.asset(
                        AssetsData.shopyIcon,
                        scale: 5.5,
                      ),
                    ),
                    RegisterTextFormFields(cubit: cubit, registerInput: registerInput,),
                    CustomTextButton(
                      onPressed: () {
                        if (context.read<RegisterInput>().formKey.currentState!.validate()) {
                          cubit.userRegister(
                            name: registerInputProvider.userNameController.text,
                            email: registerInputProvider.emailController.text,
                            password: registerInputProvider.passwordController.text,
                            phone: registerInputProvider.phoneController.text,
                          );
                        }
                      },
                      isLoading: state is RegisterLoadingStates ? true : false,
                      text: S.of(context).register,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
