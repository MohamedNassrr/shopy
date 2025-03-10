import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/styles/constance.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_divider.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_states.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/advanced_auth.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/auth_text_form_field.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/forget_pass_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/register_text_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessStates) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
        if (state is UserLoginWithGoogleSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }

        if (state is LoginFailureStates) {
          SnackBar snackBar =
              SnackBar(content: Text('email or password isn\'t correct'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<LoginCubit>(context);

        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to e-commerce',
                    style: TextsStyles.textStyle25,
                  ),
                  SizedBox(height: 45),
                  AuthTextFormField(),
                  SizedBox(height: 10),
                  ForgetPassTextButton(),
                  SizedBox(height: 10),
                  CustomTextButton(
                    colors: primaryColor,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.userLogin(
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                        );
                      }
                    },
                    isLoading: state is LoginLoadingStates ? true : false,
                    text: 'Continue',
                  ),
                  SizedBox(height: 27),
                  CustomDivider(),
                  SizedBox(height: 20),
                  AdvancedAuth(),
                  SizedBox(height: 20),
                  RegisterTextButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
