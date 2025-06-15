import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/core/utils/bloc_observer.dart';
import 'package:online_shop_app/features/settings/presentation/controller/localization_cubit/localization_cubit.dart';
import 'package:online_shop_app/shopy.dart';
import 'features/settings/presentation/controller/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  serviceLocator();
  await dotenv.load(fileName: ".env");

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (BuildContext context) => DarkModeCubit()..changeAppMode,
    ),
    BlocProvider(
      create: (BuildContext context) => LocalizationCubit(),
    ),
  ], child: const Shopy()));
}
