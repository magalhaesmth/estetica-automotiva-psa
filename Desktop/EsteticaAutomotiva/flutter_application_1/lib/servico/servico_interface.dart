import 'package:flutter_application_1/modelo/pagamento.dart';
import 'package:flutter_application_1/modelo/procedimento.dart';
import 'package:flutter_application_1/modelo/servico.dart';

abstract class InterfaceServico {
  bool validarServicosCustos(
      {required Procedimento procedimento, required Pagamento pagamento});

  double entregaAposPagamento({required Servico servico});
}
