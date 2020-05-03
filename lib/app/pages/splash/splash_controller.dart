import 'package:mobx/mobx.dart';
import 'package:project/app/modules/home/models/client.dart';
import 'package:project/app/modules/home/repository/repository_client.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final RepositoryCliente repositoryCliente;
  @observable
  Cliente _cliente;

  @observable
  String _nomeCliente;

  @computed
  String get nomeCliente => _nomeCliente;

  @action
  setNomeCliente(String nomeCliente) {
    this._nomeCliente = nomeCliente;
  }

  _SplashControllerBase(this.repositoryCliente) {
    this.getInfoCliente();
  }

  @computed
  Cliente get cliente => _cliente;

  @action
  getInfoCliente() {
    this._cliente = repositoryCliente.loadCliente();
    _nomeCliente = '';
  }
}
