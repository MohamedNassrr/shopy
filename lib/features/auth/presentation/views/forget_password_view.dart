import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/forget_pass_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPassCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: ForgetPassViewBody(),
      ),
    );
  }
}
