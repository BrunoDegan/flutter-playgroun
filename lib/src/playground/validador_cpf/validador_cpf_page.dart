import 'package:flutter/material.dart';
import 'package:flutter_playground/src/common/strings_constants.dart';
import 'package:flutter_playground/src/playground/validador_cpf/store/generator/cpf_generator_store.dart';
import 'package:flutter_playground/src/playground/validador_cpf/store/validator/cpf_validator_store.dart';

class ValidadorCpfPage extends StatefulWidget {
  const ValidadorCpfPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ValidadorCpf();
}

class _ValidadorCpf extends State<ValidadorCpfPage> {
  TextEditingController textEditingController = TextEditingController();
  final generatorStore = CpfGeneratorStore(null);
  final validatorStore = CpfValidatorStore(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text("Playground Gerador/Validador de CPF")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _cpfGeneratorContainer(),
            const SizedBox(
              height: 20,
            ),
            _cpfValidatorContainer(),
          ],
        ),
      ),
    );
  }

  _cpfValidatorContainer() {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: cpfInputDocument,
                labelText: cpf,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text(validateCPF),
              onPressed: () {
                validatorStore.validateCpf(textEditingController.text);
              },
            ),
            ValueListenableBuilder<bool>(
                valueListenable: validatorStore,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      value ? valid : notValid,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        backgroundColor: value ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  _cpfGeneratorContainer() {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ValueListenableBuilder<String?>(
              valueListenable: generatorStore,
              builder: (context, value, child) {
                return Text(
                  value ?? notValid,
                  style: TextStyle(
                    backgroundColor: value != null && value.isNotEmpty
                        ? Colors.green
                        : Colors.red,
                  ),
                );
              }),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            child: const Text(generateCPF),
            onPressed: () {
              generatorStore.generateCpf();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
