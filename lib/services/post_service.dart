// ignore_for_file: unused_local_variable

import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://diyorbek07.pythonanywhere.com';

Future<void> addFavorite(int id) async {
  String prodData = jsonEncode({
    'prodouct': id,
  });

  final response = await http.post(
    Uri.parse('$baseUrl/dafna_api/add_love/'),
    headers: {
      "Content-Type": "application/json",
      "Authorithation": 'Token ed9941049482ef84b651e53ac6c39d38c1b07438',
    },
    body: prodData,
  );
}

Future<void> addCard(int id) async {
  String prodData = jsonEncode({
    'prodouct': id,
  });

  final response = await http.post(
    Uri.parse('$baseUrl/dafna_api/add_cart/'),
    headers: {
      "Content-Type": "application/json",
      "Authorithation": 'Token ed9941049482ef84b651e53ac6c39d38c1b07438',
    },
    body: prodData,
  );
}
