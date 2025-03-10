import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/styles/constance.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_states.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var cubit = BlocProvider.of<LoginCubit>(context);
    var formKey = GlobalKey<FormState>();

    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomFormField(
                controller: emailController,
                hintText: 'email address',
                type: TextInputType.emailAddress,
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
                  onPressed: () {},
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
            ],
          ),
        );
      },
    );
  }
}
