
import 'package:ecommerce_app/src/features/data/models/product_model.dart';

abstract class JewlleryState {}

class JewlleryInitial extends JewlleryState {}

class JewlleryLoading extends JewlleryState {}

class JewlleryLoaded extends JewlleryState {
  final List<Product> jewllery;

  JewlleryLoaded(this.jewllery);
}

class JewlleryError extends JewlleryState {
  final String message;

  JewlleryError(this.message);
}
