//Biblioteca para conversão, vai ser usada para converter para JSon
import 'dart:convert';
/*Biblioteca para não ter o problema de congelamento do app quando for feita 
uma requisição
*/
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
// Serve para poder fazer uma requisação e não ter que ficar esperando

class Quotation {
// Url com a key
  final request =
      'https://api.hgbrasil.com/finance?format=json-cors&key=c1a90dfd';

  TextEditingController realController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

// atributos para receber o valor do json.
  double dolar;
  double euro;

// Future metodo que pega a string e lê o json
  Future<Map> getData() async {
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }

  void realChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void dolarChanged(String text) {
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double dolar = double.parse(text);
    //O this.dolar é para poder usar o dolar
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void euroChanged(String text) {
    // Limpa os inpunts subjacentes se estiver vazio
    if (text.isEmpty) {
      clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  void clearAll() {
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }
}
