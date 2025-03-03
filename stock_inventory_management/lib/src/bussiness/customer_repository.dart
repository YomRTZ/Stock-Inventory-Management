import 'package:stock_inventory_management/src/data/model/user_model.dart';
import 'package:stock_inventory_management/src/service/customer_provider.dart';

class CustomerRepository {
  final CustomerProvider customerProvider;
  CustomerRepository({required this.customerProvider});
   Future<List<Datum>> getCustomer() async {
    return await customerProvider.fetchCustomer();
  }
  Future<void> createCustomer(Datum user) async {
    await customerProvider.addCustomer(user);
  }
}
