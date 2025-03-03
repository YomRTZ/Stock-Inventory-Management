import 'package:equatable/equatable.dart';
import 'package:stock_inventory_management/src/data/model/product_model.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProductsEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  final Data product;
  
  AddProductEvent({required this.product});

  @override
  List<Object?> get props => [product];
}
