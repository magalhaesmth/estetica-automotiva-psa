import 'package:flutter_application_1/modelo/agendamento.dart';
import 'package:flutter_application_1/modelo/cliente.dart';
import 'package:flutter_application_1/modelo/pagamento.dart';
import 'package:flutter_application_1/modelo/procedimento.dart';
import 'package:flutter_application_1/modelo/veiculo.dart';

class Servico {
  late Cliente cliente;
  late Veiculo veiculo;
  late Agendamento? agendamento;
  late Procedimento procedimento = Procedimento();
  late Pagamento pagamento = Pagamento();
  late bool veiculoEntregue;
  late bool especialistaDisponivel;

  @override
  bool validarServicosCustos(
      {required Procedimento procedimento, required Pagamento pagamento}) {
    if (procedimento.valor + procedimento.taxaMaoDeObra ==
        pagamento.valorServico) {
      return true;
    }
    throw Exception("Valor Incorreto");
  }

  @override
  double validarEntregaAposPagamento({required Servico servico}) {
    if (servico.pagamento.valorServico <= 0.0) {
      throw Exception(
          "O veiculo não pode ser entregue pois ainda não foi pago");
    } else {
      servico.veiculoEntregue = false;
      return servico.pagamento.valorServico;
    }
  }
}
