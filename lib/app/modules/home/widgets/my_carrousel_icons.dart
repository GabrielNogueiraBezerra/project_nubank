import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_controller.dart';

class MyCarrouselIcons extends StatefulWidget {
  @override
  _MyCarrouselIconsState createState() => _MyCarrouselIconsState();
}

class _MyCarrouselIconsState extends State<MyCarrouselIcons> {
  HomeController controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Positioned(
        top: controller.screenHeight * controller.topCarrousel,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: controller.showMenu ? 0 : 1,
          child: Row(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: controller.getColor(0, controller.currentIndex),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: controller.getColor(1, controller.currentIndex),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: controller.getColor(2, controller.currentIndex),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
