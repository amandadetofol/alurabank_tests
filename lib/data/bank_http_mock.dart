import 'dart:async';
import 'dart:convert';

class BankHttpMock {
  Future<String> dolarToReal() async {
    String mockResponse = '{"USDBRL": {"high": "5.50"}}';

    // Decodificando o JSON simulado
    var jsonResponse = jsonDecode(mockResponse) as Map<String, dynamic>;
    String value = jsonResponse['USDBRL']['high'];

    return value;
  }
}

