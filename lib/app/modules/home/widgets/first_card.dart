import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_controller.dart';

class FirstCard extends StatefulWidget {
  @override
  _FirstCardState createState() => _FirstCardState();
}

class _FirstCardState extends State<FirstCard> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.credit_card,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Cartão de crédito',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'FATURA ATUAL',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 1, 187, 200),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'R\$ ',
                                  children: [
                                    TextSpan(
                                      text: controller.formatNumber(
                                          controller.cliente.faturaAtual),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 1, 187, 200),
                                  fontSize: 28,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'Limite disponivel ',
                                  children: [
                                    TextSpan(
                                      text: 'R\$ ' +
                                          controller.formatNumber(controller
                                              .cliente.limiteDisponivel),
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 158, 210, 48),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: controller.screenHeight *
                              controller.sizeBottomFirstCard,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      child: Column(
                        children: controller.getColumnsCartao(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: controller.getLastPurchaseClient(),
              ),
              color: Colors.grey[200],
            ),
          ),
        ],
      ),
    );
  }
}
