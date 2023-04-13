//Estetica Automotiva
//1 - Para realizar o serviço, o cliente deve informar o CPF corretamente
//2 - Carro deve conter placa e modelo
//3 - O serviço só poderá ser agendado com a placa e CPF do cliente
//4 - Calcular serviço + custos
//5 - Um serviço deve ter uma estimativa de entrega
//6  - O pagamento só pode ser parcelado em até 2x
//7 - A cada 10 lavagens a próxima será gratuita
//8 -  Agendamento do serviço não poderá ser realizado sem mão de obra disponível
//9 - O veículo só poderá ser entregue após pagamento
//10 - Deve apresentar a soma total do serviço

import 'package:flutter_application_1/entitdade/regras_negocio.dart';
import 'package:flutter_application_1/modelo/cliente.dart';
import 'package:flutter_application_1/modelo/procedimento.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var regras = RegrasNegocio();
  var itens = <Procedimento>[];

  var cliente = Cliente();
  cliente.nome = 'Matheus';
  cliente.cpf = '123.456.789-10';

  test("Para realizar o serviço, o cliente deve informar o CPF corretamente",
      () {
    expect(regras.validarCpf(cliente: cliente), true);
  });
}
