import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/services/google_auth_services.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_states.dart';
import 'package:online_shop_app/generated/l10n.dart';

class SignOutBlocConsumer extends StatelessWidget {
  const SignOutBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<GoogleAuthService>()),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
          if(state is UserLogoutWithGoogleSuccess){
            GoRouter.of(context).pushReplacement(AppRouter.rLoginView);
          }
        },
        builder: (context, state) {
          var logoutCubit = context.read<LoginCubit>();

          return TextButton(
            onPressed: () {
              logoutCubit.signOut();
            },
            child: Text(
              S.of(context).signOut,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}