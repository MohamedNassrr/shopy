import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/services/google_auth_services.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/views/widgets/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<GoogleAuthService>()),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
