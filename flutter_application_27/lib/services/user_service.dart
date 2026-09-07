import 'dart:convert';

import 'package:flutter_application_27/models/hair.dart';
import 'package:flutter_application_27/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const _baseUrl = 'https://dummyjson.com';

  Future<List<User>> getUsers({int limit = 5}) async {
    final url = Uri.parse('$_baseUrl/users?limit=$limit');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error al consultar usuario ${response.statusCode}');
    }
    final Map<String, dynamic> data = jsonDecode(response.body);

    final List<dynamic> jsonList = data['users'];

    return jsonList.map((j) => User.fromJson(j)).toList();
  }

  Future<List<String>> getHariColor() async {
    final url = Uri.parse('$_baseUrl/users?limit=0&select=hair');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Erro al consultar colores ${response.statusCode}');
    }
    final Map<String, dynamic> data = jsonDecode(response.body);

    final List<dynamic> jsonList = data['users'];

    final colores = <String>{};

    for (final json in jsonList) {
      final hair = Hair.fromJson(json['hair']);
      if (hair.color.isNotEmpty) colores.add(hair.color);
    }

    return colores.toList()..sort();
  }

  Future<List<User>> getUsersByHairColor(String color) async {
    final valor = Uri.encodeComponent(color);
    final url = Uri.parse(
      '$_baseUrl/users/filter?key=hair.color&value=$valor&limit=0',
    );
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error al consultar usuario ${response.statusCode}');
    }
    final Map<String, dynamic> data = jsonDecode(response.body);

    final List<dynamic> jsonList = data['users'];

    return jsonList.map((j) => User.fromJson(j)).toList();
  }

  Future<User> getUserById(int id) async {
    final url = Uri.parse('$_baseUrl/users/$id');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Error al consultar usuario ${response.statusCode}');
    }

    return User.fromJson(jsonDecode(response.body));
  }
}
