import 'package:stock_inventory_management/src/data/model/product_model.dart';
import 'package:stock_inventory_management/src/service/product_provider.dart';

class ProductRepository {
  final ProductProvider productProvider;

  ProductRepository(this.productProvider);

  Future<List<Data>> getProducts() async {
    return await productProvider.fetchProducts();
  }

  Future<void> createProduct(Data product) async {
    await productProvider.addProduct(product);
  }
}
