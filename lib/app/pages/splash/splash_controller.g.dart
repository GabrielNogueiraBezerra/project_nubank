// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  Computed<String> _$nomeClienteComputed;

  @override
  String get nomeCliente =>
      (_$nomeClienteComputed ??= Computed<String>(() => super.nomeCliente))
          .value;
  Computed<Cliente> _$clienteComputed;

  @override
  Cliente get cliente =>
      (_$clienteComputed ??= Computed<Cliente>(() => super.cliente)).value;

  final _$_clienteAtom = Atom(name: '_SplashControllerBase._cliente');

  @override
  Cliente get _cliente {
    _$_clienteAtom.context.enforceReadPolicy(_$_clienteAtom);
    _$_clienteAtom.reportObserved();
    return super._cliente;
  }

  @override
  set _cliente(Cliente value) {
    _$_clienteAtom.context.conditionallyRunInAction(() {
      super._cliente = value;
      _$_clienteAtom.reportChanged();
    }, _$_clienteAtom, name: '${_$_clienteAtom.name}_set');
  }

  final _$_nomeClienteAtom = Atom(name: '_SplashControllerBase._nomeCliente');

  @override
  String get _nomeCliente {
    _$_nomeClienteAtom.context.enforceReadPolicy(_$_nomeClienteAtom);
    _$_nomeClienteAtom.reportObserved();
    return super._nomeCliente;
  }

  @override
  set _nomeCliente(String value) {
    _$_nomeClienteAtom.context.conditionallyRunInAction(() {
      super._nomeCliente = value;
      _$_nomeClienteAtom.reportChanged();
    }, _$_nomeClienteAtom, name: '${_$_nomeClienteAtom.name}_set');
  }

  final _$_SplashControllerBaseActionController =
      ActionController(name: '_SplashControllerBase');

  @override
  dynamic setNomeCliente(String nomeCliente) {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction();
    try {
      return super.setNomeCliente(nomeCliente);
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getInfoCliente() {
    final _$actionInfo = _$_SplashControllerBaseActionController.startAction();
    try {
      return super.getInfoCliente();
    } finally {
      _$_SplashControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nomeCliente: ${nomeCliente.toString()},cliente: ${cliente.toString()}';
    return '{$string}';
  }
}
