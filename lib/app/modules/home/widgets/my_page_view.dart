import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_controller.dart';
import 'package:project/app/modules/home/widgets/card_page_view.dart';
import 'package:project/app/modules/home/widgets/first_card.dart';
import 'package:project/app/modules/home/widgets/second_card.dart';
import 'package:project/app/modules/home/widgets/third_card.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        top: (controller.yPosition == null)
            ? controller.screenHeight * controller.topPageViewCard
            : controller.yPosition,
        height: controller.screenHeight * controller.heightPageViewCard,
        left: 0,
        right: 0,
        child: GestureDetector(
          onPanUpdate: controller.onPanUpdatePageView,
          child: PageView(
            onPageChanged: controller.onChangedPageView,
            physics: controller.showMenu
                ? NeverScrollableScrollPhysics()
                : BouncingScrollPhysics(),
            children: <Widget>[
              CardPageView(
                child: FirstCard(),
              ),
              CardPageView(
                child: SecondCard(),
              ),
              CardPageView(
                child: ThirdCard(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
