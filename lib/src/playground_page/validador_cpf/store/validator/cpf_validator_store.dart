import 'package:flutter/foundation.dart';
import 'package:flutter_playground/src/playground_page/validador_cpf/model/cpf_model.dart';
import 'package:flutter_playground/src/playground_page/validador_cpf/store/validator/cpf_validator_store_contract.dart';

class CpfValidatorStore extends ValueNotifier<bool>
    implements CpfValidatorStoreContract {
  CpfValidatorStore(bool value) : super(value);

  @override
  void validateCpf(String document) {
    var model = CpfModel();
    value = model.validateDocument(document);
  }
}
