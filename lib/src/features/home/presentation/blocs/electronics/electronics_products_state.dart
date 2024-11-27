
import 'package:ecommerce_app/src/features/home/data/models/product_model.dart';

abstract class ElectronicsState {}

class ElectronicsInitial extends ElectronicsState {}

class ElectronicsLoading extends ElectronicsState {}

class ElectronicsLoaded extends ElectronicsState {
  final List<Product> electronics;

  ElectronicsLoaded(this.electronics);
}

class ElectronicsError extends ElectronicsState {
  final String message;

  ElectronicsError(this.message);
}
