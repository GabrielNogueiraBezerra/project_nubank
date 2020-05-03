import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:project/app/modules/home/repository/repository_client.dart';
import 'package:project/app/modules/home/models/client.dart';
import 'package:project/app/modules/home/models/compra.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  /// @repositorio
  /// Repositorio para buscar informações do cliente
  final RepositoryCliente _repositorio;

  /// @_screenHeight
  /// Tamanho da tela
  @observable
  double _screenHeight;

  /// @screenHeight
  /// Retorna o valor de @_screenHeight
  @computed
  double get screenHeight => _screenHeight;

  /// @setScreenHeight
  /// Seta o valor de @_screenHeight
  @action
  setScreenHeight(double screenHeight) {
    this._screenHeight = screenHeight;
  }

  /// @_screenWidth
  /// Tamanho da tela
  @observable
  double _screenWidth;

  /// @screenWidth
  /// Retorna o valor de @_screenWidth
  @computed
  double get screenWidth => _screenWidth;

  /// @setScreenWidth
  /// Seta o valor de @_screenWidth
  @action
  setScreenWidth(double screenWidth) {
    this._screenWidth = screenWidth;
  }

  /// @_sizeListMenus
  /// Tamanho do height da lista de menus
  @observable
  double _heightListMenus;

  /// @heightListMenus
  /// Retorna o valor de @_heightListMenus
  @computed
  double get heightListMenus => _heightListMenus;

  /// @_heightMenuApp
  /// Tamanho do height da lista de menus
  @observable
  double _heightMenuApp;

  /// @heightMenuApp
  /// Retorna o valor de @_heightMenuApp
  @computed
  double get heightMenuApp => _heightMenuApp;

  /// @_sizeStatusBar
  /// Tamanho do StatusBar
  @observable
  double _sizeStatusBar;

  /// @sizeStatusBar
  /// Retorna o valor de @_sizeStatusBar
  @computed
  double get sizeStatusBar => _sizeStatusBar;

  /// @setSizeStatusBar
  /// Seta o valor de @_sizeStatusBar
  @action
  setSizeStatusBar(double sizeStatusBar) {
    this._sizeStatusBar = sizeStatusBar;
  }

  /// @_sizeMenuOptions
  /// Tamanho das opções de menu
  @observable
  double _sizeMenuOptions;

  /// @sizeMenuOptions
  /// Retorna o valor de @_sizeMenuOptions
  @computed
  double get sizeMenuOptions => _sizeMenuOptions;

  /// @_sizeBottomBar
  /// Tamanho do BottomBar
  @observable
  double _sizeBottomBar;

  /// @sizeBottomBar
  /// Retorna o valor de @_sizeBottomBar
  @computed
  double get sizeBottomBar => _sizeBottomBar;

  /// @_sizeBottomFirstCard
  /// Tamanho do Bottom do primeiro card
  @observable
  double _sizeBottomFirstCard;

  /// @sizeBottomFirstCard
  /// Retorna o valor de @_sizeBottomFirstCard
  @computed
  double get sizeBottomFirstCard => _sizeBottomFirstCard;

  /// @setSizeBottomBar
  /// Seta o valor de @_sizeBottomBar
  @action
  setSizeBottomBar(double sizeBottomBar) {
    this._sizeBottomBar = sizeBottomBar;
  }

  /// @_showMenu
  /// Variável de controle do menu
  @observable
  bool _showMenu;

  /// @showMenu
  /// Retorna o valor de @_showMenu
  @computed
  bool get showMenu => this._showMenu;

  /// @_currentIndex
  /// Variável de controle dos indexes do pageview
  @observable
  int _currentIndex;

  /// @currentIndex
  /// Retorna o valor de @_currentIndex
  @computed
  int get currentIndex => this._currentIndex;

  /// @_cliente
  /// Objeto com as informações do cliente
  @observable
  Cliente _cliente;

  /// @cliente
  /// retorna o valor de _cliente
  @computed
  Cliente get cliente => this._cliente;

  /// @_yPosition
  /// Posição em Y do pageview
  @observable
  double _yPosition;

  /// @yPosition
  /// retorna o valor de _yPosition
  @computed
  double get yPosition => _yPosition;

  /// @_topPageViewCard
  /// Posição que os cards do pageview devem ficar
  @observable
  double _topPageViewCard;

  /// @topPageViewCard
  /// retorna o valor de _topPageViewCard
  @computed
  double get topPageViewCard => _topPageViewCard;

  /// @_bottomPageViewCard
  /// Posição que os cards do pageview devem ficar quando o @_showMenu for true
  @observable
  double _bottomPageViewCard;

  /// @bottomPageViewCard
  /// retorna o valor de _bottomPageViewCard
  @computed
  double get bottomPageViewCard => _bottomPageViewCard;

  /// @_heightPageViewCard
  /// Tamanho em height que os cards do pageview devem ficar
  @observable
  double _heightPageViewCard;

  /// @heightPageViewCard
  /// retorna o valor de _heightPageViewCard
  @computed
  double get heightPageViewCard => _heightPageViewCard;

  /// @_topCarrousel
  /// Posição que os itens do Carrousel irão ficar
  @observable
  double _topCarrousel;

  /// @topCarrousel
  /// retorna o valor de _topCarrousel
  @computed
  double get topCarrousel => _topCarrousel;

  /// @onPanUpdatePageView
  /// Função de arrastar do page view
  @action
  Future onPanUpdatePageView(details) async {
    double positionTopLimit = this._screenHeight * _topPageViewCard;
    double positionBottomLimit = this._screenHeight * this._bottomPageViewCard;
    double positionMiddleLimit = (positionBottomLimit - positionTopLimit) / 2;

    if (this._yPosition == null) {
      this._yPosition = this._screenHeight * _topPageViewCard;
    }

    this._yPosition += details.delta.dy;
    this._yPosition =
        (this.yPosition < positionTopLimit) ? positionTopLimit : _yPosition;
    this._yPosition = (this.yPosition > positionBottomLimit)
        ? positionBottomLimit
        : _yPosition;

    if (this._yPosition != positionBottomLimit && details.delta.dy > 0) {
      this._yPosition =
          (this.yPosition > (positionTopLimit + (positionMiddleLimit - 50)))
              ? positionBottomLimit
              : this.yPosition;
    }

    if (this._yPosition != positionTopLimit && details.delta.dy < 0) {
      this._yPosition =
          (this.yPosition < (positionBottomLimit - positionMiddleLimit))
              ? positionTopLimit
              : this.yPosition;
    }
    if (this._yPosition == positionBottomLimit) {
      this._showMenu = true;
    } else if (this._yPosition == positionTopLimit) {
      this._showMenu = false;
    }
  }

  /// @onTapMenu
  /// Função de clique do menu
  @action
  Future onTapMenu() async {
    double positionTopLimit = this._screenHeight * this._topPageViewCard;
    double positionBottomLimit = this._screenHeight * this._bottomPageViewCard;

    this._showMenu = !this._showMenu;

    this._yPosition = _showMenu ? positionBottomLimit : positionTopLimit;
  }

  /// @onChangedPageView
  /// Função de mudança de index do pageview
  @action
  Future onChangedPageView(int index) async {
    this._currentIndex = index;
  }

  /// @getColor
  /// Função que retorna a Cor do carrousel item para o index selecionado
  @action
  Color getColor(int index, int currentIndex) {
    return (index == currentIndex) ? Colors.white : Colors.white38;
  }

  /// @getInfoCliente
  /// Busco as informações do cliente no repositorio
  @action
  getInfoCliente() {
    this._cliente = this._repositorio.loadCliente();
  }

  /// @getColumnsCartao
  /// Busco as informações do cartão do cliente e faço as linhas do primeiro card
  @action
  List<Widget> getColumnsCartao() {
    double widhtContainer = 10;
    double heightPageView = ((screenHeight * heightPageViewCard) / 4) - 10;
    heightPageView = heightPageView * 3;
    List<Widget> list = [Container(), Container(), Container()];

    double heightProximasFaturasP =
        (this._cliente.proximasFaturas * 100) / this._cliente.limiteCartao;

    double heightProximasFaturasV =
        (heightPageView * heightProximasFaturasP) / 100;

    list[0] = Container(
      width: widhtContainer,
      height: heightProximasFaturasV,
      color: Color.fromARGB(255, 255, 154, 0),
    );

    double heightFaturaAtualP =
        (this._cliente.faturaAtual * 100) / this._cliente.limiteCartao;

    double heightFaturaAtualV = (heightPageView * heightFaturaAtualP) / 100;

    list[1] = Container(
      width: widhtContainer,
      height: heightFaturaAtualV,
      color: Color.fromARGB(255, 1, 187, 200),
    );

    heightPageView =
        heightPageView - (heightProximasFaturasV + heightFaturaAtualV);

    list[2] = Container(
      width: widhtContainer,
      height: heightPageView,
      color: Color.fromARGB(255, 158, 210, 48),
    );

    return list;
  }

  /// @formatNumber
  /// Faço a formatação de números para string brasileira
  @action
  String formatNumber(double number) {
    String numberReturn =
        NumberFormat.currency(customPattern: ',###.0#').format(number);

    numberReturn = numberReturn.replaceAll('.', '*');
    numberReturn = numberReturn.replaceAll(',', '.');
    numberReturn = numberReturn.replaceAll('*', ',');
    return numberReturn;
  }

  @action
  Row getLastPurchaseClient() {
    Compra compra = this._cliente.compras.last;

    Icon icon;
    switch (compra.tipo) {
      case 'Transporte':
        icon = Icon(
          Icons.directions_transit,
          color: Colors.grey,
        );
        break;
      case 'Supermercado':
        icon = Icon(
          Icons.shopping_cart,
          color: Colors.grey,
        );
        break;

      default:
        icon = Icon(
          Icons.block,
          color: Colors.grey,
        );
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        icon,
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Text(
            ('Compra mais recente em ' +
                        compra.local +
                        ' no valor de ' +
                        this.formatNumber(compra.valor) +
                        ', ' +
                        compra.datahora.toString())
                    .substring(0, 70) +
                '...',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 18,
        ),
      ],
    );
  }

  /// @_HomeControllerBase
  /// Método Construtor
  _HomeControllerBase(this._repositorio) {
    this._showMenu = false;
    this._currentIndex = 0;
    this._topPageViewCard = 0.20;
    this._heightPageViewCard = 0.45;
    this._bottomPageViewCard = 0.90;
    this._sizeMenuOptions = 0.70;
    this._topCarrousel = 0.70;
    this._heightListMenus = 0.16;
    this._heightMenuApp = 0.20;
    this._sizeBottomFirstCard = 0.055;
    this.getInfoCliente();
  }
}
