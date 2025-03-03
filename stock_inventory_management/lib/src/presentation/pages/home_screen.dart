import 'package:flutter/material.dart';
import 'package:stock_inventory_management/src/presentation/pages/customer_profile_page.dart';
import 'package:stock_inventory_management/src/presentation/pages/products_page.dart';
import 'package:stock_inventory_management/src/presentation/pages/purchase_form.dart';
import 'package:stock_inventory_management/src/presentation/pages/sales_form.dart';
import 'package:stock_inventory_management/src/presentation/pages/supplier_profile_page.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {"icon": Icons.inventory, "name": "Products", "screen": const ProductsPage()},
    {
      "icon": Icons.people,
      "name": "Customers",
      "screen": const CustomerProfilePage()
    },
    {"icon": Icons.store, "name": "Suppliers", "screen": const SupplierProfilePage()},
    {"icon": Icons.sell, "name": "Sales", "screen": const SalesForm()},
    {"icon": Icons.shopping_cart, "name": "Purchase", "screen": const PurchasesForm()},
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Stock and Inventory Management")),
        backgroundColor:  const Color(0xFFCE7128),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // 2 columns
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => items[index]['screen'],
                  ),
                );
              },
              child: Card(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(items[index]['icon'], size: 50, color:  const Color(0xFF3D97CC)),
                    const SizedBox(height: 10),
                    Text(
                      items[index]['name'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
