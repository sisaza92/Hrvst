import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/models/despacho_model.dart';

class DespachoApiClient {
  final String baseUrl;

  DespachoApiClient({required this.baseUrl});

  Future<List<Despacho>> getAllDespachos(int page, int size) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/despachos?page=$page&size=$size'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Despacho.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load despachos');
    }
  }

  Future<Despacho> crearDespacho(Despacho despacho) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/despachos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(despacho.toJson()),
    );

    if (response.statusCode == 200) {
      final dynamic jsonResponse = json.decode(response.body);
      return Despacho.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to create despacho');
    }
  }
}
