//Estetica Automotiva
//1 - Para realizar o serviço, o cliente deve informar o CPF corretamente
//2 - Para realizar o serviço, o veiculo deve conter placa e modelo
//3 - O serviço só poderá ser agendado com a placa e CPF do cliente válidos
//4 - Calcular serviço + custos
//5 - Um serviço deve ter uma estimativa de entrega
//6  - O pagamento só pode ser parcelado em até 2x
//7 - A cada 10 lavagens a próxima será gratuita
//8 -  Agendamento do serviço não poderá ser realizado sem mão de obra disponível
//9 - O veículo só poderá ser entregue após pagamento
//10 - Deve apresentar a soma total do serviço

import 'package:flutter_application_1/entitdade/regras_negocio.dart';
import 'package:flutter_application_1/modelo/cliente.dart';
import 'package:flutter_application_1/modelo/pagamento.dart';
import 'package:flutter_application_1/modelo/procedimento.dart';
import 'package:flutter_application_1/modelo/servico.dart';
import 'package:flutter_application_1/modelo/veiculo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var regras = RegrasNegocio();
  var itens = <Procedimento>[];

  var cliente = Cliente();
  cliente.nome = 'Matheus';
  cliente.cpf = '123.456.789-09';
  cliente.quantidadeProcedimentos = 10;
  //cliente.quantidadeProcedimentos = 6; ThrowException quantas lavagens faltam

  var veiculo = Veiculo();
  veiculo.modelo = "Astra Sedan 2011";
  veiculo.placa = "AUC-2901";

  var pagamento = Pagamento();
  pagamento.valorServico = 310.0;
  pagamento.quantidadeParcelas = 2;

  var servico = Servico();
  servico.especialistaDisponivel = true;
  servico.cliente = cliente;
  servico.veiculo = veiculo;

  var procedimento = Procedimento();
  procedimento.nome = "Polimento dos Faróis + Lavagem Completa";
  procedimento.taxaMaoDeObra = 35;
  procedimento.valor = 275.0;
  procedimento.tempoGasto = 8;

  // 1
  test("Para realizar o serviço, o cliente deve informar o CPF corretamente",
      () {
    expect(regras.validarCpf(cliente: cliente), true);
  });

  // 2
  test("Para realizar o serviço, o veiculo deve conter placa e modelo", () {
    expect(regras.validarPlacaModelo(veiculo: veiculo), true);
  });

  // 3
  test("O serviço só poderá ser agendado com a placa e CPF do cliente válidos",
      () {
    expect(regras.validarAgendamento(veiculo: veiculo, cliente: cliente), true);
  });

  // 4
  test("Deverá calcular serviço + custos", () {
    expect(
        regras.validarServicosCustos(
            procedimento: procedimento, pagamento: pagamento),
        true);
  });

  // 5
  test("Um serviço deve ter uma estimativa de entrega", () {
    expect(regras.estimativaDataEntrega(procedimento: procedimento), true);
  });

  // 6
  test("O pagamento só pode ser realizados a vista ou parcelados em até 2x",
      () {
    expect(regras.parcelasPagamento(pagamento: pagamento), true);
  });

  // 7
  test("A cada 10 lavagens a próxima será gratuita", () {
    expect(regras.validarFidelidade(cliente: cliente), true);
  });

  // 8
  test(
      "Agendamento do serviço não poderá ser realizado sem mão de obra disponível",
      () {
    expect(regras.validarSemMaoDeObra(servico: servico), true);
  });

  //9
  test("O veículo só poderá ser entregue após pagamento", () {
    servico.pagamento.valorServico = 0.0;
    servico.veiculoEntregue = false;
    expect(
        regras.validarEntregaAposPagamento(servico: servico), throwsException);
  });

//10
  test("Deve apresentar a soma total do serviço", () {
    expect(
        regras.validarCustos(procedimento: procedimento, pagamento: pagamento),
        true);
  });
}
