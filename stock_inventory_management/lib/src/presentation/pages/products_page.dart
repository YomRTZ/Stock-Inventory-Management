import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/presentation/components/product_card.dart';
import 'package:stock_inventory_management/src/presentation/forms/add_product.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_event.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_state.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
     void initState() {
    BlocProvider.of<ProductBloc>(context).add(LoadProductsEvent());
    super.initState();
  }
         
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return const Center(child: Text("No products available."));
            }
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final dataItem = state.products[index];
                print("dataItem: $dataItem"); 
                return ProductCard(
                  productName:dataItem.productName??"Unknown Product",
                  description:dataItem.description??"No description available",
                  category: dataItem.category,
                  // supplier: dataItem.supplier,
                  price: dataItem.price.toString(),
                  quantity: dataItem.quantityInStock.toString(),
                );
              },
            );
          }
          return const Center(child: Text("No product found."));
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Product", 
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductForm()),
          );
        },
        backgroundColor: const Color(0xFFCE7128),
        child: const Icon(Icons.add),
      ),
    );
  }
}
