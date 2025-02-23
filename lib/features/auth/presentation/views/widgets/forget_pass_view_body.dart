import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/widgets/custom_form_field.dart';
import 'package:online_shop_app/core/widgets/custom_text_button.dart';
import 'package:online_shop_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_states.dart';

class ForgetPassViewBody extends StatelessWidget {
  const ForgetPassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<ForgetPassCubit, ForgetPassStates>(
      listener: (context, state) {
        if (state is ForgetPassSuccessStates) {
          GoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<ForgetPassCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 20,
              children: [
                CustomFormField(
                  controller: emailController,
                  hintText: 'enter email',
                  type: TextInputType.emailAddress,
                  suffix: Icons.email_rounded,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'enter your email';
                    }
                    return null;
                  },
                  onSubmit: (value) {
                    if (formKey.currentState!.validate()) {
                      cubit.changePassword(
                        email: emailController.text,
                      );
                    }
                  },
                ),
                CustomTextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.changePassword(email: emailController.text);
                    }
                  },
                  isLoading: state is ForgetPassLoadingStates ? true : false,
                  text: 'send code',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
