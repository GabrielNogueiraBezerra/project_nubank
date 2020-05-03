import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_controller.dart';
import 'package:project/app/modules/home/widgets/item_menu_list.dart';

class MyListMenu extends StatefulWidget {
  @override
  _MyListMenuState createState() => _MyListMenuState();
}

class _MyListMenuState extends State<MyListMenu> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Positioned(
        bottom: controller.sizeBottomBar,
        left: 0,
        right: 0,
        height: controller.screenHeight * controller.heightListMenus,
        child: IgnorePointer(
          ignoring: controller.showMenu,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: controller.showMenu ? 0 : 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemMenuList(
                      icon: Icons.person_outline,
                      text: 'Indicar amigos',
                    ),
                    ItemMenuList(
                      icon: Icons.phone_android,
                      text: 'Recarga de celular',
                    ),
                    ItemMenuList(
                      icon: Icons.payment,
                      text: 'Cobrar',
                    ),
                    ItemMenuList(
                      icon: Icons.attach_money,
                      text: 'Depositar',
                    ),
                    ItemMenuList(
                      icon: Icons.arrow_downward,
                      text: 'Transferir',
                    ),
                    ItemMenuList(
                      icon: Icons.settings_applications,
                      text: 'Ajustar Limite',
                    ),
                    ItemMenuList(
                      icon: Icons.blur_linear,
                      text: 'Pagar',
                    ),
                    ItemMenuList(
                      icon: Icons.credit_card,
                      text: 'Bloquear Cartão',
                    ),
                    ItemMenuList(
                      icon: Icons.credit_card,
                      text: 'Cartão Virtual',
                    ),
                    ItemMenuList(
                      icon: Icons.art_track,
                      text: 'Organizar atalhos',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
