import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_inventory_management/src/common/constant_url.dart';
import 'package:stock_inventory_management/src/data/model/product_model.dart';

class ProductProvider {
  final String url = "${AppUrl.baseUrl}products";

  // Fetch products
  Future<List<Data>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(url));
      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse is! Map || !jsonResponse.containsKey('data')) {
          throw Exception("Invalid response format: Missing 'data' field");
        }

        List<dynamic> productList = jsonResponse['data'] ?? [];

        return productList.map((data) {
          try {
            return Data.fromJson(data);
          } catch (e) {
            throw Exception("Error parsing product data: $e");
          }
        }).toList();
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception("Fetch error: $error");
    }
  }

  Future<void> addProduct(Data product) async {
    final response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add product: ${response.body}");
    }
  }
}
