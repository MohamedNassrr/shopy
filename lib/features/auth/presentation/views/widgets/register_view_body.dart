import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_states.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterUserCreateSuccessStates) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<RegisterCubit>(context);
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(
                      controller: nameController,
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
                      controller: emailController,
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
                            controller: passwordController,
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
                            controller: confirmPasswordController,
                            hintText: 'confirm',
                            type: TextInputType.visiblePassword,
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffix,
                            suffixPressed: cubit.changePasswordVisibilty,
                            validation: (value) {
                              if (value != passwordController.text) {
                                return 'password didn\'t match';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    CustomFormField(
                      controller: phoneController,
                      hintText: '01234567890',
                      type: TextInputType.phone,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'phone mustn\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userRegister(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      isLoading: state is RegisterLoadingStates ? true : false,
                      text: 'Register',
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
