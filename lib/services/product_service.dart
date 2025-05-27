import 'dart:convert';
import 'package:bloc_api_6_7/constant/api_constant.dart';
import 'package:bloc_api_6_7/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  ProductService._internal();
  static final ProductService _instance = ProductService._internal();
  static ProductService get instance => _instance;

  final String _apiUrl = ApiConstant.API_URL;

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Product> products =
          data.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception("Failed to load products: ${response.statusCode}");
    }
  }

  Future<Product> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$_apiUrl/$id'));
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load product detail");
    }
  }
}
