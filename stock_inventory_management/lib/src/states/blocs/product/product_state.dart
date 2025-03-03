import 'package:equatable/equatable.dart';
import 'package:stock_inventory_management/src/data/model/product_model.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Data> products;

  ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}
class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}

class ProductAdded extends ProductState {}
