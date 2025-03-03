import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/bussiness/user_repository.dart';
import 'package:stock_inventory_management/src/data/model/user_model.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_event.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_state.dart';
import 'package:stock_inventory_management/src/data/model/product_model.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Datum> _suppliers = [];
  Datum? _selectedSupplier;

  @override
  void initState() {
    super.initState();
    _fetchSuppliers();
  }

  Future<void> _fetchSuppliers() async {
    try {
      final suppliers = await context.read<UserRepository>().getUser();
      setState(() {
        _suppliers = suppliers;
        _selectedSupplier = _suppliers.isNotEmpty ? _suppliers[0] : null;
      });
    } catch (e) {
      print("Error fetching suppliers: $e");
    }
  }

  // Submit the form
  void _submitForm() {
    try {
      Data newProduct = Data(
        productName: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        price: _priceController.text.trim(),
        quantityInStock: int.parse(_quantityController.text.trim()),
        // supplier: _selectedSupplier,
      );

      context.read<ProductBloc>().add(AddProductEvent(product: newProduct));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid price or quantity.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text("Adding Product..."),
                    ],
                  ),
                );
              },
            );
          } else if (state is ProductAdded) {
            if (mounted) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product added successfully!")),
            );
            if (mounted) Navigator.pop(context);
          } else if (state is ProductError) {
            if (mounted) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Product Name"),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: "Description"),
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Price"),
              ),
              TextFormField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Quantity"),
              ),
              const SizedBox(height: 20),
                  
              // supplier dropdown
              DropdownButtonFormField<Datum>(
                value: _selectedSupplier,
                onChanged: (Datum? newValue) {
                  setState(() {
                    _selectedSupplier = newValue;
                  });
                },
                items:
                    _suppliers.map<DropdownMenuItem<Datum>>((Datum supplier) {
                  return DropdownMenuItem<Datum>(
                    value: supplier,
                    child: Text(supplier.name),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: "Supplier"),
              ),
                  
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Add Product"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
