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
}
