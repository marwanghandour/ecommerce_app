import 'package:ecommerce_app/src/features/home/data/repositories/product_repo.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/clothing/clothing_event.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/clothing/clothing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClothingBloc extends Bloc<ClothingProductsEvent, ClothingState> {
  final ProductRepository productRepository;

  ClothingBloc(this.productRepository) : super(ClothingInitial()) {
    on<FetchClothing>(_fetchClothing);
  }

  void _fetchClothing(FetchClothing event, Emitter<ClothingState> emit) async {
    emit(ClothingLoading());
    try {
      final products = await productRepository.fetchClothing();
      emit(ClothingLoaded(products));
    } catch (e) {
      emit(ClothingError('Failed to fetch products'));
    }
  }
}
