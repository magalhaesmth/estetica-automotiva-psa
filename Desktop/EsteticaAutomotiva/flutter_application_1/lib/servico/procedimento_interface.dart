import 'package:flutter_application_1/modelo/pagamento.dart';
import 'package:flutter_application_1/modelo/procedimento.dart';

abstract class InterfaceProcedimento {
  bool estimativaDataEntrega({required Procedimento procedimento});

  String mostrarCustos(
      {required Procedimento procedimento, required Pagamento pagamento});
}
