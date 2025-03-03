import 'package:flutter/material.dart';

class PurchasesForm extends StatefulWidget {
  const PurchasesForm({super.key});

  @override
  _PurchasesFormState createState() => _PurchasesFormState();
}

class _PurchasesFormState extends State<PurchasesForm> {
  final _formKey = GlobalKey<FormState>();
    final TextEditingController _productController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _purchaseQuantityController = TextEditingController();
  final TextEditingController _purchasePriceController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
        final product = _productController.text;
      final supplier = _supplierController.text;
      final quantity = _purchaseQuantityController.text;
      final price = _purchasePriceController.text;

      print('Purchases - Supplier: $supplier, Quantity: $quantity, Price: $price,product:$product');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Purchases form submitted')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Purchases Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               TextFormField(
                controller: _productController,
                decoration: const InputDecoration(labelText: 'Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _supplierController,
                decoration: const InputDecoration(labelText: 'Supplier'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the supplier name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _purchaseQuantityController,
                decoration: const InputDecoration(labelText: 'Purchase Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the purchase quantity';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _purchasePriceController,
                decoration: const InputDecoration(labelText: 'Purchase Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the purchase price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
