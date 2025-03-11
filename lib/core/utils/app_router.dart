import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop_app/core/services/google_auth_services.dart';
import 'package:online_shop_app/features/auth/presentation/controller/login_cubit/login_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/controller/register_cubit/register_cubit.dart';
import 'package:online_shop_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_shop_app/features/auth/presentation/views/login_view.dart';
import 'package:online_shop_app/features/auth/presentation/views/register_view.dart';
import 'package:online_shop_app/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kLoginView = '/';
  static const kRegisterView = '/RegisterView';
  static const kHomeView = '/HomeView';
  static const kForgetPassView = '/ForgetPasswordView';

  final GoogleAuthService authService;

  AppRouter(
    this.authService,
  );

  static final router = GoRouter(
    initialLocation: initialLocation(),
    routes: [
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GoogleAuthService()),
          child: LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: RegisterView(),
        ),
      ),
      GoRoute(
        path: kForgetPassView,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => HomeView(),
      ),
    ],

  );
 static String initialLocation(){
   User? user = FirebaseAuth.instance.currentUser;
   return user != null ? kHomeView : kLoginView;
 }
}
