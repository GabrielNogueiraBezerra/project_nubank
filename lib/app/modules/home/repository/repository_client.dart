import 'package:project/app/modules/home/models/client.dart';
import 'package:project/app/modules/home/models/compra.dart';
import 'package:project/app/modules/home/models/deposito.dart';

class RepositoryCliente {
  /// @loadCliente return Cliente
  Cliente loadCliente() {
    List<Compra> compras = [];

    Compra c1 = new Compra(
      datahora: DateTime.parse("2020-05-03 09:35:18Z"),
      local: 'Imperial Comercio e Tr',
      tipo: 'Transporte',
      valor: 15.00,
    );

    Compra c2 = new Compra(
      datahora: DateTime.parse("2020-05-03 10:55:23Z"),
      local: 'Mercado Nossa Familia',
      tipo: 'Supermercado',
      valor: 146.76,
    );

    compras.add(c1);
    compras.add(c2);

    List<Deposito> depositos = [];

    Deposito d1 = new Deposito(
      datahora: DateTime.parse("2020-05-03 09:35:18Z"),
      operacao: 'Entrada',
      valor: 924.20,
    );

    Deposito d2 = new Deposito(
      datahora: DateTime.parse("2020-05-03 10:55:23Z"),
      operacao: 'Saida',
      valor: 147.20,
    );

    depositos.add(d1);
    depositos.add(d2);

    Cliente c = new Cliente(
      nome: 'Gabriel',
      qrCode:
          'https://webmobtuts.com/wp-content/uploads/2019/02/QR_code_for_mobile_English_Wikipedia.svg_.png',
      agencia: '0001',
      conta: '99999999-0',
      limiteCartao: 1700.00,
      faturaAtual: 1102.48,
      proximasFaturas: 525.21,
      compras: compras,
      depositos: depositos,
    );
    return c;
  }
}
