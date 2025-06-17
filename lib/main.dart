import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:online_shop_app/core/services/local_storage.dart';
import 'package:online_shop_app/core/services/service_locator.dart';
import 'package:online_shop_app/core/utils/bloc_observer.dart';
import 'package:online_shop_app/shopy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await LocalStorage.init();
  bool? isDark = LocalStorage.getBool(key: 'isDark');
  serviceLocator();
  await dotenv.load(fileName: ".env");

  runApp(Shopy(isDark));
}
