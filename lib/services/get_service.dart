// ignore_for_file: unused_local_variable

import 'package:http/http.dart' as http;
import 'dart:convert';

String baseUrl = 'https://diyorbek07.pythonanywhere.com';

//GET CATALOG

Future<List> getCatalog() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_katalog/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data['katalogs'];
}

//GET CONTACT

Future<List> getContact() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_contact/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data['contacts'];
}

// GET MAIN CONTACT

Future<List> getMainContact() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_main_contact/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data['main_contacts'];
}

//GET NEW PRODUCTS

Future<List> getNewproduct() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_new_prodouct/'),
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  // print(response.headers);
  Map data = json.decode(utf8.decode(response.bodyBytes));
  // print(data);
  return data['prodoucts'];
}

//GET RECOMMENDATION

Future<List> getRecommendation() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_rescommentations/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  // If the server did return a 200 OK response,
  // then parse the JSON.
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data['prodoucts'];
}

//GET CATALOG TYPE

Future<Map> getCatalogType(int id) async {
  // Get request to Api
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_prodouct_type/$id/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data;
}

//GET PRODUCTS

Future<Map> getProducts(int id) async {
  // Get request to Api
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_prodouct/$id/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data;
}

// GET PRODUCT DETAIL

Future<Map> getProductDetail(int id) async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_prodouct_detail/$id/'),
    headers: {
      "Content-Type": "application/json",
    },
  );

  Map data = jsonDecode(utf8.decode(response.bodyBytes));

  return data['prodouct'];
}

// DELETE LIKED PRODUCT

Future<void> deleteLike(int id) async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/delete_love/$id/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
}

// GET FAVORITES

Future<List> getFavorite() async {
  var headers = {'Content-Type': 'application/json', 'Authorization': 'Token ed9941049482ef84b651e53ac6c39d38c1b07438'};
  http.Response response = await http.get(
    Uri.parse('https://diyorbek07.pythonanywhere.com/dafna_app/get_love/'),
    headers: headers,
  );

  if (response.statusCode == 200) {
    // print(await);
    return jsonDecode(response.body)['loves'];
  } else {
    print(response.reasonPhrase);
    throw Exception('Failed to load album');
  }
}

// GET SEARCH RESULT

Future<List> getSearch(String value) async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/sort/$value/'),
    headers: {
      "Content-Type": "application/json",
    },
  );
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data['sorts'];
}

// GET CART RESULT

Future<Map> getCart() async {
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/get_cart/'),
    headers: {
      "Content-Type": "application/json",
      "Authorithation": 'Token ed9941049482ef84b651e53ac6c39d38c1b07438',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With",
    },
  );
  Map data = jsonDecode(utf8.decode(response.bodyBytes));
  return data;
}

// DELETE CART BY ID

Future<void> deleteCart(int id) async {
  String prodData = jsonEncode({'id': id});
  final response = await http.get(
    Uri.parse('$baseUrl/dafna_app/delete_cart/$id/'),
    headers: {"Content-Type": "application/json"},
  );
}
