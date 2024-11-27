import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/features/home/data/models/product_model.dart';

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<Product>> fetchProducts() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/products');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }


 Future<List<Product>> fetchElectronics() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/categories/2/products');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }



  Future<List<Product>> fetchClothing() async {
    final response = await dio.get("https://api.escuelajs.co/api/v1/categories/1/products");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

Future<List<Product>> fetchShoes() async {
    final response = await dio.get("https://api.escuelajs.co/api/v1/categories/4/products");
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

}
