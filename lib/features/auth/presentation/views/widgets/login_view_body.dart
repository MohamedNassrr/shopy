import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/styles/constance.dart';
import 'package:online_shop_app/core/styles/texts_styles.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_divider.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_states.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/advanced_auth.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var cubit = BlocProvider.of<LoginCubit>(context);
    var formKey = GlobalKey<FormState>();

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
        return Form(
          key: formKey,
          child: Center(
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
                    CustomFormField(
                      controller: emailController,
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
                      controller: passwordController,
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
                        if (formKey.currentState!.validate()) {
                          cubit.userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kForgetPassView);
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextButton(
                      colors: primaryColor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userLogin(
                            email: emailController.text,
                            password: passwordController.text,
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
                    Row(
                      spacing: 3.2,
                      children: [
                        Text('Don\'t have an account yet?'),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push(AppRouter.kRegisterView);
                          },
                          child: Text(
                            'Register'.toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text('Now'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
