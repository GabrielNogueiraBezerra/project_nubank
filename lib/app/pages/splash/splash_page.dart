import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/pages/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4)).then((v) {
      controller.setNomeCliente(controller.cliente.nome);
      Future.delayed(Duration(seconds: 1)).then((v) {
        Modular.to.pushReplacementNamed('/home/');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 50,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Observer(builder: (context) {
                return Text(controller.nomeCliente,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
