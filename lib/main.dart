import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/app/app_bloc/src/bloc_observer.dart';
import 'package:music_app/data/database/db/app_db.dart';
import 'package:music_app/di/injector.dart';
import 'package:music_app/my_app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  AppDatabase.setupSqlCipher();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}
