import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          brightness: Brightness.dark,
        ));
  }
}
