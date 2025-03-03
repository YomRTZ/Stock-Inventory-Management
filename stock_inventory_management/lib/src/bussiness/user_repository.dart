import 'package:stock_inventory_management/src/data/model/user_model.dart';
import 'package:stock_inventory_management/src/service/user_provider.dart';

class UserRepository {
  final UserProvider userProvider;
  UserRepository({required this.userProvider});
  //get user
  Future<List<Datum>> getUser() async {
    return await userProvider.fetchUser();
  }
  // Add user
 Future<void> createUser(Datum user) async {
    await userProvider.addUser(user);
  }
}
