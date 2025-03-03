//represent action or input that tigger changes in application

import 'package:stock_inventory_management/src/data/model/user_model.dart';

class CustomerEvent {}

class GetCustomerEvent extends CustomerEvent {}

class AddCustomerEvant extends CustomerEvent {
  final Datum data;
  AddCustomerEvant({required this.data});
}
