//Procedimento Estético a ser realizado = Polimento, limpeza dos bancos...
import 'package:flutter_application_1/modelo/pagamento.dart';
import 'package:intl/intl.dart';

class Procedimento {
  late String nome;
  late double taxaMaoDeObra;
  late double valor;
  late int tempoGasto;
  late Pagamento pagamento;

  @override
  bool estimativaDataEntrega({required Procedimento procedimento}) {
    if (procedimento.tempoGasto < 10) {
      DateTime now = DateTime.now();
      DateTime dataEntrega = now.add(Duration(hours: procedimento.tempoGasto));
      String dataFormatada = DateFormat('dd/MM/yyyy').format(dataEntrega);
      String tempoFormatado = DateFormat('HH:mm').format(dataEntrega);
      print(
          "Seu veículo estará pronto às $tempoFormatado do dia $dataFormatada");
      return true;
    }
    return false;
  }

  String validarCustos(
      {required Procedimento procedimento, required Pagamento pagamento}) {
    if (procedimento.valor + procedimento.taxaMaoDeObra ==
        pagamento.valorServico) {
      print("R\$ ${pagamento.valorServico}");
      return "${pagamento.valorServico}";
    }
    throw Exception("Valor Incorreto");
  }
}
