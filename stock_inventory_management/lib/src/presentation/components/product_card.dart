import 'package:flutter/material.dart';
import 'package:stock_inventory_management/src/data/model/product_model.dart';
// import 'package:stock_inventory_management/src/data/model/user_model.dart';

class ProductCard extends StatefulWidget {
  final String productName;
  final Category? category;
  final String description;
  // final Datum? supplier;
  final String price;
  final String quantity;

  const ProductCard({
    super.key,
    required this.productName,
    required this.category,
    required this.description,
    // required this.supplier,
    required this.price,
    required this.quantity,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.transparent),
                    image: const DecorationImage(
                      image: AssetImage('images/cements.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productName,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.description),
                  Text("Stock: ${widget.quantity}"),
                  Text("Category: ${widget.category?.name ?? 'Unknown'}"),
                  // if (widget.supplier != null)
                  //   Text(
                  //       "Supplier: ${widget.supplier?.name ?? 'Unknown Supplier'}"), // Supplier info
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFCE7128),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text('View Detail'),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
