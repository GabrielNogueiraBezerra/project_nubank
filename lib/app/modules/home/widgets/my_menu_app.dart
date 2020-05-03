import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project/app/modules/home/home_controller.dart';
import 'package:project/app/modules/home/widgets/item_menu.dart';

class MyMenuApp extends StatefulWidget {
  @override
  _MyMenuAppState createState() => _MyMenuAppState();
}

class _MyMenuAppState extends State<MyMenuApp> {
  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Positioned(
        top: controller.screenHeight * controller.topPageViewCard,
        left: 0,
        right: 0,
        child: AnimatedOpacity(
          duration: Duration(
            milliseconds: 200,
          ),
          opacity: controller.showMenu ? 1 : 0,
          child: Container(
            height: controller.screenHeight * controller.sizeMenuOptions,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Image.network(
                    controller.cliente.qrCode,
                    height: 120,
                    color: Colors.white,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Banco ',
                      children: [
                        TextSpan(
                          text: '260 - Nu Pagamentos S.A.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Agência ',
                      children: [
                        TextSpan(
                          text: controller.cliente.agencia,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Conta ',
                      children: [
                        TextSpan(
                          text: controller.cliente.conta,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: <Widget>[
                        ItemMenu(
                          icon: Icons.info_outline,
                          text: 'Me ajuda',
                          observacao: '',
                        ),
                        ItemMenu(
                          icon: Icons.credit_card,
                          text: 'Pedir função débito',
                          observacao: '',
                        ),
                        ItemMenu(
                          icon: Icons.person_outline,
                          text: 'Perfil',
                          observacao: 'Nome de preferência, telefone, e-mail',
                        ),
                        ItemMenu(
                          icon: Icons.settings,
                          text: 'Configurar Conta',
                          observacao: '',
                        ),
                        ItemMenu(
                          icon: Icons.credit_card,
                          text: 'Configurar Cartão',
                          observacao: '',
                        ),
                        ItemMenu(
                          icon: Icons.store_mall_directory,
                          text: 'Pedir Conta PJ',
                          observacao: '',
                        ),
                        ItemMenu(
                          icon: Icons.phone_android,
                          text: 'Configurações do app',
                          observacao: '',
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 0.7,
                            color: Colors.white54,
                          )),
                          child: RaisedButton(
                            color: Colors.purple[800],
                            highlightColor: Colors.transparent,
                            elevation: 0,
                            disabledElevation: 0,
                            focusElevation: 0,
                            highlightElevation: 0,
                            hoverElevation: 0,
                            splashColor: Colors.purple[900],
                            child: Text(
                              'SAIR DA CONTA',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
