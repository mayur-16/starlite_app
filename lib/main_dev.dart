import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:starlite_app/config_main.dart';
import 'app.dart';
import 'flavors.dart';

void main() async{
  F.appFlavor = Flavor.dev;
  await configMain();
  runApp(const StarliteApp());
  FlutterNativeSplash.remove();
}
