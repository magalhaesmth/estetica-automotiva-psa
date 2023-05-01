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
  bool calcularProcedimentoMaoDeObra(
      {required Procedimento procedimento, required Pagamento pagamento}) {
    if (procedimento.valor < 0 &&
        procedimento.taxaMaoDeObra < 0 &&
        pagamento.valorServico < 0) {
      throw Exception("Valor não pode ser negativo!");
    }

    if (procedimento.valor + procedimento.taxaMaoDeObra ==
        pagamento.valorServico) {
      print("Valor incorreto!");
      return true;
    }
    throw Exception("Valor Incorreto");
  }

  // @override
  // bool verificarCalculoMenor()

  @override
  double entregaAposPagamento({required Servico servico}) {
    if (servico.pagamento.valorServico <= 0.0) {
      throw Exception(
          "O veiculo não pode ser entregue pois ainda não foi pago");
    } else {
      print("O veiculo foi entregue!");
      servico.veiculoEntregue = true;
      return servico.pagamento.valorServico;
    }
  }
}
