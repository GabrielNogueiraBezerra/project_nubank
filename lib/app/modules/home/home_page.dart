import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/widgets/my_app_bar.dart';
import 'package:project/app/modules/home/widgets/my_list_menu.dart';
import 'package:project/app/modules/home/widgets/my_menu_app.dart';
import 'package:project/app/modules/home/widgets/my_page_view.dart';
import 'package:project/app/modules/home/widgets/my_carrousel_icons.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    if (controller.screenHeight == null) {
      controller.setScreenHeight(MediaQuery.of(context).size.height);
    }

    if (controller.screenWidth == null) {
      controller.setScreenWidth(MediaQuery.of(context).size.width);
    }

    if (controller.sizeStatusBar == null) {
      controller.setSizeStatusBar(MediaQuery.of(context).padding.top);
    }

    if (controller.sizeBottomBar == null) {
      controller.setSizeBottomBar(MediaQuery.of(context).padding.bottom);
    }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(),
          MyMenuApp(),
          MyListMenu(),
          MyCarrouselIcons(),
          MyPageView(),
        ],
      ),
    );
  }
}
