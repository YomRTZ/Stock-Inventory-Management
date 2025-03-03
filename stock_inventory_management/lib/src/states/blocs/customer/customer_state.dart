// it represent the current condition of the data 
import 'package:stock_inventory_management/src/data/model/user_model.dart';

class CustomerState {}
class CustomerInitialState extends CustomerState {}

class CustomerLoadingState extends CustomerState {}

class CustomerSuccessState extends CustomerState {
  final List<Datum> userData; 
  CustomerSuccessState(this.userData);
}

class CustomerErrorState extends CustomerState {
  final String error;
 CustomerErrorState(this.error);
}
class AddCustomerStateInitial extends CustomerState {}

class AddCustomerStateLoading extends CustomerState {}

class AddCustomerStateSuccess extends CustomerState {}

class AddCustomerStateErrorState extends CustomerState {
  final String error;
  AddCustomerStateErrorState(this.error);
}