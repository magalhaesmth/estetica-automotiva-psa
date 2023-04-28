import 'package:flutter_application_1/servico/pagamento_interface.dart';

class Pagamento implements InterfacePagamento {
  late double valorServico;
  late int quantidadeParcelas;
  late String formaPagamento;

  static const aVista = 'À vista';
  static const duasVezes = 'Parcelado em 2X';
  static const tresVezes = 'Parcelado em 3X';

  @override
  String parcelasPagamento({required Pagamento pagamento}) {
    if (pagamento.formaPagamento == aVista) {
      return aVista;
    } else if (pagamento.formaPagamento == duasVezes) {
      return duasVezes;
    } else if (pagamento.formaPagamento == tresVezes) {
      return tresVezes;
    } else {
      throw Exception("Podemos parcelar somente até 3 vezes!");
    }
  }
}
