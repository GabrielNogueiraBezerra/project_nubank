import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_controller.dart';

class MyAppBar extends StatefulWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: controller.sizeStatusBar,
          ),
          GestureDetector(
            onTap: controller.onTapMenu,
            child: Container(
              height: controller.screenHeight * controller.heightListMenus,
              color: Colors.purple[800],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        'https://logodownload.org/wp-content/uploads/2019/08/nubank-logo-3.png',
                        height: 35,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.cliente.nome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Icon(controller.showMenu
                      ? Icons.expand_less
                      : Icons.expand_more),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
