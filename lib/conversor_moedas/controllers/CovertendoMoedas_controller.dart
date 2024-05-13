import 'dart:convert';

import 'package:http/http.dart' as http;

class convertendoMoedasControllers {
  static Future<List<dynamic>> conversorMoedas() async {
    final response = await http
        .get(Uri.parse("https://api.hgbrasil.com/finance?format=json"));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var valorDolar = json['results'];
      final name = valorDolar['currencies'];
      final dollar = name['USD'];
      final euro = name['EUR'];
      List valoresEuroeDollar = [];
      valoresEuroeDollar.add(dollar['buy']);
      valoresEuroeDollar.add(euro['buy']);
      return valoresEuroeDollar;
    }
    return [];
  }
}
