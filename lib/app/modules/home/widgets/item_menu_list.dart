import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_controller.dart';

class ItemMenuList extends StatefulWidget {
  final IconData icon;
  final String text;

  const ItemMenuList({Key key, this.icon, this.text}) : super(key: key);

  @override
  _ItemMenuListState createState() => _ItemMenuListState();
}

class _ItemMenuListState extends State<ItemMenuList> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 12,
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(widget.icon),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        width: (controller.screenWidth / 4) - (20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white24,
        ),
      ),
    );
  }
}
