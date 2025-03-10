import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/core/services/api_service.dart';
import 'package:online_shop_app/core/utils/app_router.dart';
import 'package:online_shop_app/core/utils/bloc_observer.dart';
import 'package:online_shop_app/features/home/data/repos/home_repo_impl.dart';
import 'package:online_shop_app/features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'package:online_shop_app/features/home/presentation/controller/product_cubit/product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        // Set status bar color to white
        statusBarIconBrightness: Brightness.dark,
        // Set icon brightness to dark for visibility
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(),),
        BlocProvider(create: (context) => ProductCubit(HomeRepoImpl(ApiService()))..fetchProductData(),)
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
