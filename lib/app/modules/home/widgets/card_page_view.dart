import 'package:flutter/material.dart';

class CardPageView extends StatelessWidget {
  final Widget child;

  const CardPageView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
      ),
    );
  }
}
