import 'package:get_it/get_it.dart';
import 'package:stock_inventory_management/src/bussiness/customer_repository.dart';
import 'package:stock_inventory_management/src/bussiness/product_repository.dart';
import 'package:stock_inventory_management/src/bussiness/user_repository.dart';
import 'package:stock_inventory_management/src/service/customer_provider.dart';
import 'package:stock_inventory_management/src/service/product_provider.dart';
import 'package:stock_inventory_management/src/service/user_provider.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_bloc.dart';

final GetIt getIt = GetIt.instance;

void getitSetUp() {
  // User(supplier)
  getIt.registerLazySingleton<UserProvider>(() => UserProvider());
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(userProvider: getIt<UserProvider>()));
  getIt.registerFactory<UserBloc>(
    () => UserBloc(userRepository: getIt<UserRepository>()),
  );
//customer
getIt.registerLazySingleton<CustomerProvider>(() => CustomerProvider());
  getIt.registerLazySingleton<CustomerRepository>(
      () => CustomerRepository(customerProvider: getIt<CustomerProvider>()));
  getIt.registerFactory<CustomerBloc>(
    () => CustomerBloc(customerRepository: getIt<CustomerRepository>()),
  );

  // Product
  getIt.registerLazySingleton<ProductProvider>(() => ProductProvider());
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepository(getIt<ProductProvider>()));
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(getIt<ProductRepository>()),
  );
}
