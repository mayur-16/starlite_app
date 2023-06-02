import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';
import 'config_main.dart';
import 'flavors.dart';

void main() async{
  F.appFlavor = Flavor.prod;
  await configMain();
  runApp(const StarliteApp());
  FlutterNativeSplash.remove();
}
