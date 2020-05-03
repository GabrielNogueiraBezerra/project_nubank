import 'package:project/app/modules/home/models/compra.dart';

class Cliente {
  String nome;
  String qrCode;
  String agencia;
  String conta;
  double limiteCartao;
  double limiteDisponivel;
  double proximasFaturas;
  double faturaAtual;
  List<Compra> compras;

  Cliente({
    this.nome,
    this.qrCode,
    this.agencia,
    this.conta,
    this.limiteCartao,
    this.proximasFaturas,
    this.faturaAtual,
    this.compras,
  }) {
    this.limiteDisponivel =
        this.limiteCartao - this.proximasFaturas - this.faturaAtual;
  }
}
