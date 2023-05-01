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
    DateTime now = DateTime.now();
    if (procedimento.tempoGasto < 8) {
      DateTime dataEntrega = now.add(Duration(hours: procedimento.tempoGasto));
      String dataFormatada = DateFormat('dd/MM/yyyy').format(dataEntrega);
      String tempoFormatado = DateFormat('HH:mm').format(dataEntrega);
      if (dataEntrega.hour > 18) {
        throw Exception("O seu veiculo só estara pronto no dia seguinte!");
      }
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
    print("Valor Incorreto");
    throw Exception("Valor Incorreto");
  }
}
