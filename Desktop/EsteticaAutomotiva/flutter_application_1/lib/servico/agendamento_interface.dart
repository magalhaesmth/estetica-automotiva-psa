import 'package:flutter_application_1/modelo/agendamento.dart';
import 'package:flutter_application_1/modelo/cliente.dart';
import 'package:flutter_application_1/modelo/servico.dart';
import 'package:flutter_application_1/modelo/veiculo.dart';

abstract class InterfaceAgendamento {
  bool validarPlacaCPF({required Veiculo veiculo, required Cliente cliente});

  bool validarSemMaoDeObra({required Servico servico});
}
