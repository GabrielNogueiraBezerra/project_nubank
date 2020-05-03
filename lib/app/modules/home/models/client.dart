import 'package:project/app/modules/home/models/compra.dart';
import 'package:project/app/modules/home/models/deposito.dart';

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
  List<Deposito> depositos;

  Cliente({
    this.nome,
    this.qrCode,
    this.agencia,
    this.conta,
    this.limiteCartao,
    this.proximasFaturas,
    this.faturaAtual,
    this.compras,
    this.depositos,
  }) {
    this.limiteDisponivel =
        this.limiteCartao - this.proximasFaturas - this.faturaAtual;
  }

  double getCurrentAccount() {
    double accountCurrentReturn = 0;
    if (depositos != null) {
      depositos.forEach((f) => {
            f.operacao == "Entrada"
                ? accountCurrentReturn += f.valor
                : accountCurrentReturn -= f.valor
          });
    }
    return accountCurrentReturn;
  }
}
