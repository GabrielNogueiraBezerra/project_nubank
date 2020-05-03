import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final String observacao;

  const ItemMenu({Key key, this.icon, this.text, this.observacao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.7,
            color: Colors.white54,
          ),
          top: BorderSide(
            width: 0.7,
            color: Colors.white54,
          ),
        ),
      ),
      child: RaisedButton(
        color: Colors.purple[800],
        highlightColor: Colors.transparent,
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        splashColor: Colors.purple[900],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    observacao != ''
                        ? Text(
                            observacao,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
            Icon(Icons.chevron_right, size: 16),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
