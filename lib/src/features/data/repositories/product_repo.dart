import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/features/data/models/product_model.dart';

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<Product>> fetchProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }


 Future<List<Product>> fetchElectronics() async {
    final response = await dio.get('https://fakestoreapi.com/products/category/electronics');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Product>> fetchJewllery() async {
    final response = await dio.get('https://fakestoreapi.com/products/category/jewelery');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }


  Future<List<Product>> fetchClothing() async {
    final response = await dio.get("https://fakestoreapi.com/products/category/women's clothing");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }




}
