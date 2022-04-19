import 'package:flutter_playground/src/playground_page/validador_cpf/model/cpf_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final cpfModel = CpfModel();

  test('Não deve validar CPF com dígitos iguais', () {
    String cpf = '00000000000';
    expect(cpfModel.validateDocument(cpf), false);
  });

  test('Não deve validar CPF com  mais de 11 dígitos', () {
    String cpf = '12345678910111';
    expect(cpfModel.validateDocument(cpf), false);
  });

  test('Deve validar CPF com 11 dígitos incluindo dígitos separadores', () {
    String cpf = '123.456.789-11';
    expect(cpfModel.validateDocument(cpf), true);
  });

  test('Deve validar CPF com 11 dígitos', () {
    String cpf = '12345678910';
    expect(cpfModel.validateDocument(cpf), true);
  });

  test('Deve gerar um cpf válido com 14 dígitos incluindo separadores', () {
    expect(cpfModel.generateCpf().length, 14);
  });
}
