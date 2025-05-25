import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/constance.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/utils/assets_data.dart';
import 'package:online_shop_app/core/widgets/custom_divider.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/data/models/login_input.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_states.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/advanced_auth.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/auth_text_form_field.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/forget_pass_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/register_text_button.dart';
import 'package:provider/provider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginInput = LoginInput();

    return Provider.value(
      value: loginInput,
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessStates) {
            GoRouter.of(context).pushReplacement(AppRouter.rHomeView);
          }
          if (state is UserLoginWithGoogleSuccess) {
            GoRouter.of(context).pushReplacement(AppRouter.rHomeView);
          }

          if (state is LoginFailureStates) {
            SnackBar snackBar = const SnackBar(
                content: Text('email or password isn\'t correct'));
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
                    Image.asset(
                      AssetsData.shopyIcon,
                      scale: 5.5,
                    ),
                    const Text(
                      'Welcome to Shopy',
                      style: TextsStyles.textStyle25,
                    ),
                    const SizedBox(height: 45),
                    AuthTextFormField(
                      loginInput: loginInput,
                    ),
                    const SizedBox(height: 10),
                    const ForgetPassTextButton(),
                    const SizedBox(height: 10),
                    CustomTextButton(
                      colors: primaryColor,
                      onPressed: () {
                        if (context
                            .read<LoginInput>()
                            .formKey
                            .currentState!
                            .validate()) {
                          cubit.userLogin(
                            email:
                                context.read<LoginInput>().emailController.text,
                            password: context
                                .read<LoginInput>()
                                .passwordController
                                .text,
                          );
                        }
                      },
                      isLoading: state is LoginLoadingStates ? true : false,
                      text: 'Continue',
                    ),
                    const SizedBox(height: 27),
                    const CustomDivider(),
                    const SizedBox(height: 20),
                    const AdvancedAuth(),
                    const SizedBox(height: 20),
                    const RegisterTextButton(),
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
