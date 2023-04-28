import 'package:flutter_application_1/servico/veiculo_interface.dart';

class Veiculo implements InterfaceVeiculo {
  late String placa;
  late String modelo;
  late String cpf; //Cpf do dono do veiculo

  @override
  bool validarPlacaModelo({required Veiculo veiculo}) {
    if (veiculo.placa.isNotEmpty && veiculo.modelo.isNotEmpty) {
      print("Placa e modelo Válidos");
      return true;
    }
    throw Exception("Placa e modelo do veiculo inválidas");
  }
}
