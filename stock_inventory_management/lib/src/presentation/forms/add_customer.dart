import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/data/model/user_model.dart';
import 'package:stock_inventory_management/src/presentation/pages/customer_profile_page.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_event.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_state.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void submitForm() {
    if (_fullNameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required!")),
      );
      return;
    }
    Datum newCustomer = Datum(
      name: _fullNameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      address: _addressController.text.trim(),
    );
    context.read<CustomerBloc>().add(AddCustomerEvant(data: newCustomer));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Form")),
      body: BlocListener<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state is AddCustomerStateLoading) {
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
                      Text("Adding Customer..."),
                    ],
                  ),
                );
              },
            );
          } else if (state is AddCustomerStateSuccess) {
            if (mounted) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Customer added successfully!")),
            );
            if (mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CustomerProfilePage()),
              );
            }
          } else if (state is AddCustomerStateErrorState) {
            if (mounted) Navigator.pop(context);

            if (mounted) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Error"),
                    content: Text(state.error),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: "Full Name"),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: "Address"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: const Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
