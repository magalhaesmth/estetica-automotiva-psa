import 'package:flutter_application_1/modelo/pessoa.dart';
import 'package:flutter_application_1/servico/cliente_interface.dart';

class Cliente extends Pessoa implements InterfaceCliente {
  late int quantidadeProcedimentos;
  late bool proximoProcedimentoGratis;

  @override
  bool validarFidelidade({required Cliente cliente}) {
    if (cliente.quantidadeProcedimentos == 10) {
      print("Proxima lavagem será gratuita!");
      return cliente.proximoProcedimentoGratis = true;
    }
    print(
        "Faltam ${10 - cliente.quantidadeProcedimentos} lavagens ou outros serviços");
    throw Exception(
        "Faltam ${10 - cliente.quantidadeProcedimentos} lavagens ou outros serviços");
  }
}
