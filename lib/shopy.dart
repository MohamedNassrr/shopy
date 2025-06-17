import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:online_shop_app/core/theme/theme_data.dart';
import 'package:online_shop_app/features/Cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:online_shop_app/features/category/data/repos/cat_repo_impl.dart';
import 'package:online_shop_app/features/category/presentation/controller/category_cubit/category_cubit.dart';
import 'package:online_shop_app/features/settings/presentation/controller/localization_cubit/localization_cubit.dart';
import 'package:online_shop_app/features/settings/presentation/controller/localization_cubit/localization_states.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_router.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/controller/home_cubit/home_cubit.dart';
import 'features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'features/settings/presentation/controller/dark_mode_cubit/dark_mode_cubit.dart';
import 'features/settings/presentation/controller/dark_mode_cubit/dark_mode_states.dart';
import 'generated/l10n.dart';

class Shopy extends StatelessWidget {
  final bool? isDark;
  final Locale? lang;

  const Shopy(this.isDark,this.lang, {super.key});



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
          create: (context) => CategoryCubit(getIt.get<CatRepoImpl>())..fetchCategories(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) =>
          ProductCubit(getIt.get<HomeRepoImpl>())..fetchProductData(),
        ),
        BlocProvider(
          create: (BuildContext context) => LocalizationCubit()..setInitialLang(lang),
        ),
        BlocProvider(
          create: (BuildContext context) => DarkModeCubit()..changeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocBuilder<DarkModeCubit,DarkModeStates>(
        builder: (BuildContext context, state) {
          var darkModeCubit = BlocProvider.of<DarkModeCubit>(context);
          var langCubit = BlocProvider.of<LocalizationCubit>(context);
          return BlocBuilder<LocalizationCubit,LocalizationStates>(

            builder: (BuildContext context, state) {
              return MaterialApp.router(
                locale: langCubit.currentLocale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                themeMode: darkModeCubit.isDark ? ThemeMode.dark : ThemeMode.light,
                darkTheme: TAppTheme.darkTheme,
                theme: TAppTheme.lightTheme,
                debugShowCheckedModeBanner: false,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
