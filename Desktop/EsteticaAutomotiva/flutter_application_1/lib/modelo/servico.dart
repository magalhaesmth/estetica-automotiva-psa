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
}
