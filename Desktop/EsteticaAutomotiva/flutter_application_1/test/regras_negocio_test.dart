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

import 'package:flutter_application_1/modelo/agendamento.dart';
import 'package:flutter_application_1/modelo/cliente.dart';
import 'package:flutter_application_1/modelo/pagamento.dart';
import 'package:flutter_application_1/modelo/procedimento.dart';
import 'package:flutter_application_1/modelo/servico.dart';
import 'package:flutter_application_1/modelo/veiculo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var agendamento = Agendamento();
  var itens = <Procedimento>[];

  var cliente = Cliente();
  cliente.nome = 'Matheus';
  cliente.cpf = '123.456.789-09';
  cliente.quantidadeProcedimentos = 10;

  var veiculo = Veiculo();
  veiculo.modelo = "Astra Sedan 2011";
  veiculo.placa = "AUC-2901";

  var pagamento = Pagamento();
  pagamento.valorServico = 310.0;
  pagamento.quantidadeParcelas = 1;
  pagamento.formaPagamento = 'À vista';

  var servico = Servico();
  servico.especialistaDisponivel = true;
  servico.cliente = cliente;
  servico.veiculo = veiculo;

  var procedimento = Procedimento();
  procedimento.nome = "Polimento dos Faróis + Lavagem Completa";
  procedimento.taxaMaoDeObra = 35;
  procedimento.valor = 275;
  procedimento.tempoGasto = 0;

  // 1
  test(
      "Para realizar o serviço, o cliente deve informar os numeros do CPF corretamente",
      () {
    expect(cliente.validarCpf(cliente.cpf), true);

    //Testa se os numeros do cpf do cliente estão informados corretamente.
    cliente.cpf = '41254354312';
    expect(cliente.validarCpf(cliente.cpf), false);
  });

  // 2
  test("Para realizar o serviço, o veiculo deve conter placa e modelo", () {
    expect(veiculo.validarPlacaModelo(veiculo: veiculo), true);

    //Testa se a placa e o modelo do veiculos estão validos para uso.
    veiculo.modelo = "";
    veiculo.placa = "";
    expect(() => veiculo.validarPlacaModelo(veiculo: veiculo), throwsException);
  });

  // 3
  test("O serviço só poderá ser agendado com a placa e CPF do cliente válidos",
      () {
    expect(
        agendamento.validarPlacaCPF(veiculo: veiculo, cliente: cliente), true);

    //Testa se a placa e o cpf do cliente estão validos para uso.
    veiculo.placa = "";
    cliente.cpf = '12342145';
    expect(
        () => agendamento.validarPlacaCPF(veiculo: veiculo, cliente: cliente),
        throwsException);
  });

  // 4
  test("Deverá calcular procedimento + mão de obra", () {
    expect(
        servico.calcularProcedimentoMaoDeObra(
            procedimento: procedimento, pagamento: pagamento),
        true);

    //Testa se o procedimento + mão de obra estão calculados corretamente.
    procedimento.taxaMaoDeObra = -4;
    procedimento.valor = -2145;
    pagamento.valorServico = 0.0;
    expect(
        () => servico.calcularProcedimentoMaoDeObra(
            procedimento: procedimento, pagamento: pagamento),
        throwsException);
  });

  // 5
  test("Um serviço deve ter uma estimativa de entrega", () {
    expect(
        procedimento.estimativaDataEntrega(procedimento: procedimento), true);

    //Colocar tempo gasto para dar depois das 18hrs da tarde!!
    //Testa se a estimativa de entrega será para hoje ou amanhã se passar das 6 da tarde.
    procedimento.tempoGasto = 5;
    expect(() => procedimento.estimativaDataEntrega(procedimento: procedimento),
        throwsException);
  });

  // 6
  test("O pagamento só pode ser parcelado em até 3x", () {
    expect(pagamento.parcelasPagamento(pagamento: pagamento), 'À vista');

    pagamento.formaPagamento = 'Parcelado em 2X';
    expect(
        pagamento.parcelasPagamento(pagamento: pagamento), 'Parcelado em 2X');

    pagamento.formaPagamento = 'Parcelado em 3X';
    expect(
        pagamento.parcelasPagamento(pagamento: pagamento), 'Parcelado em 3X');

    pagamento.formaPagamento = 'Parcelado em 4X';
    expect(() => pagamento.parcelasPagamento(pagamento: pagamento),
        throwsException);

    pagamento.formaPagamento = 'Parcelado em 5X';
    expect(() => pagamento.parcelasPagamento(pagamento: pagamento),
        throwsException);

    //Testa se quiser parcelar em mais de 3x, da erro.
  });

  // 7
  test("A cada 10 lavagens a próxima será gratuita", () {
    expect(cliente.validarFidelidade(cliente: cliente), true);

    cliente.quantidadeProcedimentos = 6;
    expect(() => cliente.validarFidelidade(cliente: cliente), throwsException);
  });

  // 8
  test(
      "Agendamento do serviço não poderá ser realizado sem mão de obra disponível",
      () {
    expect(agendamento.temMaoDeObraDisponivel(servico: servico), true);
  });

  //9
  test("O veículo só poderá ser entregue após pagamento", () {
    servico.pagamento.valorServico = 0.0;
    servico.veiculoEntregue = false;
    expect(() => servico.validarEntregaAposPagamento(servico: servico),
        throwsException);

    //Testa se foi pago o serviço, o veiculo é entregue
    servico.pagamento.valorServico = 310.0;
    servico.veiculoEntregue = false;
    expect(servico.validarEntregaAposPagamento(servico: servico), 310.0);
  });

//10
  test("Deve apresentar a soma total do serviço", () {
    expect(
        procedimento.validarCustos(
            procedimento: procedimento, pagamento: pagamento),
        "${pagamento.valorServico}");

    //Testa a entrega do valor do serviço, se for errado ou não.
    pagamento.valorServico = 100.0;
    expect(
        () => procedimento.validarCustos(
            procedimento: procedimento, pagamento: pagamento),
        throwsException);
  });
}
