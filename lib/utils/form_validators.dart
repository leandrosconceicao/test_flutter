mixin FormValidators {
  String? todoValidation(String? value) {
    if (value!.isEmpty) {
      return "Obrigatório";
    }
    return null;
  }
  String? userInputValidation(String? value) {
    if (value!.isEmpty) {
      return "Obrigatório";
    }
    if (value.length > 20) {
      return "Tamanho limite excedido (20 caracteres)";
    }
    if (value.endsWith(' ')) {
      return "Último caractere inválido";
    }
    return null;
  }

  String? passInputValidation(String? value) {
    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    if (value!.isEmpty) {
      return "Obrigatório";
    }
    if (value.length > 20) {
      return "Tamanho limite excedido (20 caracteres)";
    }
    if (value.endsWith(' ')) {
      return "Último caractere inválido";
    }
    if (!validCharacters.hasMatch(value)) {
      return "Caracteres inválidos foram informados";
    }
    return null;
  }
}
