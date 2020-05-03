import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.purple[800],
  ));
  runApp(ModularApp(module: AppModule()));
}
