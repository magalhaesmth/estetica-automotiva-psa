import 'package:flutter_application_1/modelo/cliente.dart';
import 'package:flutter_application_1/modelo/servico.dart';
import 'package:flutter_application_1/modelo/veiculo.dart';
import 'package:flutter_application_1/servico/agendamento_interface.dart';

class Agendamento implements InterfaceAgendamento {
  late DateTime dataAgendamento;
  late Cliente cliente;
  late Veiculo veiculo;
  late Servico servico;

  @override
  bool validarPlacaCPF({required Veiculo veiculo, required Cliente cliente}) {
    if (veiculo.placa.isNotEmpty && cliente.cpf.isNotEmpty) {
      print("Placa e CPF válidos para o agendamento");
      return true;
    }
    throw Exception("Placa e CPF do cliente não são válidos.");
  }

  @override
  bool validarSemMaoDeObra({required Servico servico}) {
    if (servico.especialistaDisponivel) {
      var agendamento = Agendamento();
      agendamento.dataAgendamento = DateTime(2023, DateTime.april, 04, 27, 23);
      agendamento.cliente = servico.cliente;
      servico.agendamento = agendamento;
      return true;
    } else {
      servico.agendamento = null;
      throw Exception("Não há especialista disponivel para essa data!");
    }
  }
}
