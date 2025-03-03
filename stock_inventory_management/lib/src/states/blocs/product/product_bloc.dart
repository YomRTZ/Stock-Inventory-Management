import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/bussiness/product_repository.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_event.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await productRepository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<AddProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        await productRepository.createProduct(event.product);
        emit(ProductAdded());
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
