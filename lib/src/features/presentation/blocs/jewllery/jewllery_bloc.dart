import 'package:ecommerce_app/src/features/data/repositories/product_repo.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/jewllery/jewllery_event.dart';
import 'package:ecommerce_app/src/features/presentation/blocs/jewllery/jewllery_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JewlleryBloc extends Bloc<JewlleryEvent, JewlleryState> {
  final ProductRepository productRepository;

  JewlleryBloc(this.productRepository) : super(JewlleryInitial()) {
    on<FetchJewllery>(_fetchJewllery);
  }

  void _fetchJewllery(FetchJewllery event, Emitter<JewlleryState> emit) async {
    emit(JewlleryLoading());
    try {
      final products = await productRepository.fetchJewllery();
      emit(JewlleryLoaded(products));
    } catch (e) {
      emit(JewlleryError('Failed to fetch products'));
    }
  }
}
