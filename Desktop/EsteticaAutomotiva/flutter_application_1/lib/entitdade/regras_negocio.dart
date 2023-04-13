import 'package:flutter_application_1/entitdade/validador_cpf.dart';
import 'package:flutter_application_1/modelo/cliente.dart';

class RegrasNegocio {
  bool validarCpf({required Cliente cliente}) {
    return ValidadorCpf.validarCpf(cliente.cpf);
  }
}
