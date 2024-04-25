import 'dart:io';

class Pessoa {
  int _idade;
  String _nome;
  double _altura;
  double _peso;

  Pessoa(this._idade, this._nome, this._altura, this._peso);

  int get idade {
    return _idade;
  }

  String get nome {
    return _nome;
  }

  double get altura {
    return _altura;
  }

  double get peso {
    return _peso;
  }

  set idade(int novaIdade) {
    if (novaIdade >= 0) {
      _idade = novaIdade;
    } else {
      print("Idade inválida. Deve ser um valor positivo.");
    }
  }

  set altura(double novaAltura) {
    if (novaAltura > 0.0 && novaAltura < 3.0) {
      _altura = novaAltura;
    } else {
      print("Altura inválida. Deve estar entre 0.0 e 3.0 metros.");
    }
  }

  double calcularIMC() {
    double imc = _peso / (_altura * _altura);
    return imc;
  }

  String classificarPeso() {
    double imc = calcularIMC();
    if (imc < 18.5) {
      return "MAGREZA";
    } else if (imc >= 18.5 && imc < 25.0) {
      return "NORMAL";
    } else if (imc >= 25.0 && imc < 30.0) {
      return "SOBREPESO";
    } else if (imc >= 30.0 && imc < 40.0) {
      return "OBESIDADE";
    } else {
      return "OBESIDADE GRAVE";
    }
  }
}

void main() {
  print("Digite o nome:");
  var nome = stdin.readLineSync();
  print("Digite a idade:");
  var idade = int.parse(stdin.readLineSync()!);
  print("Digite a altura (em metros):");
  var altura = double.parse(stdin.readLineSync()!);
  print("Digite o peso (em kg):");
  var peso = double.parse(stdin.readLineSync()!);

  var pessoa = Pessoa(idade, nome!, altura, peso);
  print("Nome: ${pessoa.nome}");
  print("Idade: ${pessoa.idade} anos");
  print("Altura: ${pessoa.altura} metros");
  print("IMC: ${pessoa.calcularIMC().toStringAsFixed(2)}");
  print("Classificação de Peso: ${pessoa.classificarPeso()}");
}
