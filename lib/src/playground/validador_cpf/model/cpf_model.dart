import 'dart:math';

class CpfModel {
  final int cpfLength = 10;
  final String emptyString = '';

  CpfModel();

  String _sanitizeDocument(String cpfInput) {
    return cpfInput.replaceAll('.', '').replaceAll('-', '');
  }

  bool _validateForSameValues(List<int> cpfSplitted) {
    return cpfSplitted.every((cpfNumber) => cpfSplitted[0] == cpfNumber);
  }

  List<int> _parseDocument(String document) {
    List<int> parsedDocument = [];
    document.split(emptyString).forEach(
      (element) {
        int? parsedElement = int.tryParse(element);
        if (parsedElement != null) {
          parsedDocument.add(parsedElement);
        }
      },
    );
    return parsedDocument;
  }

  bool validateDocument(String cpfInput) {
    var sanitizedDocument = _sanitizeDocument(cpfInput);

    List<int> cpfSplitted = _parseDocument(sanitizedDocument);

    if (_validateForSameValues(cpfSplitted)) {
      return false;
    }

    if (cpfSplitted.length < 11 || cpfSplitted.length > 11) return false;

    return true;
  }

  String generateCpf() {
    String cpfGenerated = "";
    while (validateDocument(cpfGenerated) == false) {
      cpfGenerated = Random().nextInt(999999999).toString();
      cpfGenerated += Random().nextInt(99).toString();
      if (cpfGenerated.length == 11) {
        if (!_validateForSameValues(_parseDocument(cpfGenerated))) {
          var cpfValue = cpfGenerated.substring(0, 3) +
              '.' +
              cpfGenerated.substring(3, 6) +
              '.' +
              cpfGenerated.substring(6, 9) +
              '-' +
              cpfGenerated.substring(9, 11);

          return cpfValue;
        }
      }
    }
    return cpfGenerated;
  }
}
