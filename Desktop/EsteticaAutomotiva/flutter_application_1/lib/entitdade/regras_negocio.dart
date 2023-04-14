import 'package:flutter_application_1/entitdade/validador_cpf.dart';
import 'package:flutter_application_1/modelo/agendamento.dart';
import 'package:flutter_application_1/modelo/cliente.dart';
import 'package:flutter_application_1/modelo/pagamento.dart';
import 'package:flutter_application_1/modelo/procedimento.dart';
import 'package:flutter_application_1/modelo/servico.dart';
import 'package:flutter_application_1/modelo/veiculo.dart';

class RegrasNegocio {
  //1
  bool validarCpf({required Cliente cliente}) {
    return ValidadorCpf.validarCpf(cliente.cpf);
  }

  //2
  bool validarPlacaModelo({required Veiculo veiculo}) {
    if (veiculo.placa.isNotEmpty && veiculo.modelo.isNotEmpty) {
      print("Placa e modelo Válidos");
      return true;
    }
    throw Exception("Placa e modelo do veiculo inválidas");
  }

  //3
  bool validarAgendamento(
      {required Veiculo veiculo, required Cliente cliente}) {
    if (veiculo.placa.isNotEmpty && cliente.cpf.isNotEmpty) {
      print("Placa e CPF válidos para o agendamento");
      return true;
    }
    throw Exception("Placa e CPF do cliente não são válidos.");
  }

  //4
  bool validarServicosCustos(
      {required Procedimento procedimento, required Pagamento pagamento}) {
    if (procedimento.valor + procedimento.taxaMaoDeObra ==
        pagamento.valorServico) {
      return true;
    }
    throw Exception("Valor Incorreto");
  }

  //5
  bool estimativaDataEntrega({required Procedimento procedimento}) {
    if (procedimento.tempoGasto < 10) {
      print("A estimativa de entrega é após 8hrs de serviço");
      return true;
    }
    return false;
  }

  //6
  bool parcelasPagamento({required Pagamento pagamento}) {
    if (pagamento.quantidadeParcelas <= 2) {
      return true;
    }
    throw Exception("Pagamentos só podem ser realizados até em 2x");
  }

  //7
  bool validarFidelidade({required Cliente cliente}) {
    if (cliente.quantidadeProcedimentos == 10) {
      return cliente.proximoProcedimentoGratis = true;
    }
    throw Exception(
        "Faltam ${10 - cliente.quantidadeProcedimentos} lavagens ou outros serviços");
  }

  //8
  bool validarSemMaoDeObra({required Servico servico}) {
    if (servico.especialistaDisponivel) {
      var agendamento = Agendamento();
      agendamento.dataAgendamento = DateTime(2023, DateTime.april, 14, 04, 23);
      agendamento.cliente = servico.cliente;
      servico.agendamento = agendamento;
      return true;
    } else {
      servico.agendamento = null;
      throw Exception("Não há especialista disponivel para essa data!");
    }
  }

  //9
  double validarEntregaAposPagamento({required Servico servico}) {
    if (servico.pagamento.valorServico <= 0.0) {
      throw Exception(
          "O veiculo não pode ser entregue pois ainda não foi pago");
    } else {
      servico.veiculoEntregue = false;
      return servico.pagamento.valorServico;
    }
  }

  bool validarCustos(
      {required Procedimento procedimento, required Pagamento pagamento}) {
    if (procedimento.valor + procedimento.taxaMaoDeObra ==
        pagamento.valorServico) {
      return true;
    }
    throw Exception("Valor Incorreto");
  }
}
