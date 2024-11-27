import 'package:ecommerce_app/src/features/home/data/repositories/product_repo.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/jewllery/jewllery_event.dart';
import 'package:ecommerce_app/src/features/home/presentation/blocs/jewllery/jewllery_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JewlleryBloc extends Bloc<JewlleryEvent, JewlleryState> {
  final ProductRepository productRepository;

  JewlleryBloc(this.productRepository) : super(JewlleryInitial()) {
    on<FetchJewllery>(_fetchJewllery);
  }

  void _fetchJewllery(FetchJewllery event, Emitter<JewlleryState> emit) async {
    emit(JewlleryLoading());
    try {
      final products = await productRepository.fetchShoes();
      emit(JewlleryLoaded(products));
    } catch (e) {
      emit(JewlleryError('Failed to fetch products'));
    }
  }
}
