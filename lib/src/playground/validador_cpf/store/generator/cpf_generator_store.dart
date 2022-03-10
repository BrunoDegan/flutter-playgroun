import 'package:flutter/foundation.dart';
import 'package:flutter_playground/src/playground/validador_cpf/model/cpf_model.dart';
import 'package:flutter_playground/src/playground/validador_cpf/store/generator/cpf_generator_store_contract.dart';

class CpfGeneratorStore extends ValueNotifier<String?>
    implements CpfGeneratorStoreContract {
  CpfGeneratorStore() : super("");

  @override
  void generateCpf() {
    var model = CpfModel();
    value = model.generateCpf();
  }
}
