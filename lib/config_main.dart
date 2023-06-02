
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:starlite_app/get_it/get_it.dart';
import 'package:starlite_app/logger.dart';

import 'core/local_db_client.dart';

Future<void> configMain () async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  Logger().setLogLevel(LogLevel.info);
  Logger().setShowInReleaseMode(false);
}
