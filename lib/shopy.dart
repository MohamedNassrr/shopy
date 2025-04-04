import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_router.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'features/home/presentation/controller/product_cubit/product_cubit.dart';

class Shopy extends StatelessWidget {
  const Shopy({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        // Set status bar color to white
        statusBarIconBrightness: Brightness.dark,
        // Set icon brightness to dark for visibility
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) =>
          ProductCubit(getIt.get<HomeRepoImpl>())..fetchProductData(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
