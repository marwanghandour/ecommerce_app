import 'package:ecommerce_app/src/features/home/data/repositories/product_repo.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/electronics/electronics_products_event.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/electronics/electronics_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ElectronicsProductsBloc extends Bloc<ElectronicsProductsEvent, ElectronicsState> {
  final ProductRepository productRepository;

  ElectronicsProductsBloc(this.productRepository) : super(ElectronicsInitial()) {
    on<FetchElectronics>(fetchElectronics);
  }

  void fetchElectronics(FetchElectronics event, Emitter<ElectronicsState> emit) async {
    emit(ElectronicsLoading());
    try {
      final products = await productRepository.fetchElectronics();
      emit(ElectronicsLoaded(products));
    } catch (e) {
      emit(ElectronicsError('Failed to fetch products'));
    }
  }
}
