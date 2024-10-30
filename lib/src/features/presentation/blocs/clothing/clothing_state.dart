
import 'package:ecommerce_app/src/features/data/models/product_model.dart';

abstract class ClothingState {}

class ClothingInitial extends ClothingState {}

class ClothingLoading extends ClothingState {}

class ClothingLoaded extends ClothingState {
  final List<Product> clothing;

  ClothingLoaded(this.clothing);
}

class ClothingError extends ClothingState {
  final String message;

  ClothingError(this.message);
}
