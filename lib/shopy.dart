import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_shop_app/core/theme/theme_data.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/category/data/repos/cat_repo_impl.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_cubit.dart';
import 'package:online_shop_app/features/settings/presentation/controller/settings_cubit/settings_cubit.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_router.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'generated/l10n.dart';

class Shopy extends StatelessWidget {
  final bool? isDark;
  final Locale? lang;

  const Shopy(this.isDark, this.lang, {super.key});

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
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(getIt.get<CatRepoImpl>())..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) =>
              ProductCubit(getIt.get<HomeRepoImpl>())..fetchProductData(),
        ),
        BlocProvider(
          create: (BuildContext context) => SettingsCubit()
            ..setInitialLang(lang)
            ..setAppMode(fromShared: isDark),
        ),

      ],
      child: Builder(
        builder: (context) {
          final settingCubit = context.watch<SettingsCubit>();
          return MaterialApp.router(
            locale: settingCubit.currentLocale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            themeMode: settingCubit.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: TAppTheme.darkTheme,
            theme: TAppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        }
      ),
    );
  }
}
