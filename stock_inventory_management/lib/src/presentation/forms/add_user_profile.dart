import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_event.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_state.dart';
import 'package:stock_inventory_management/src/data/model/user_model.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

void _submitForm() {
  if (_fullNameController.text.trim().isEmpty ||
      _emailController.text.trim().isEmpty ||
      _phoneController.text.trim().isEmpty ||
      _addressController.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All fields are required!")),
    );
    return;
  }

  Datum newUser = Datum(
    name: _fullNameController.text.trim(),
    email: _emailController.text.trim(),
    phone: _phoneController.text.trim(),
    address: _addressController.text.trim(),
  );
  context.read<UserBloc>().add(AddUserEvent(user: newUser));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Form")),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is AddUserStateLoading) {
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
                      Text("Adding User..."),
                    ],
                  ),
                );
              },
            );
          } else if (state is AddUserStateSuccess) {
            if (mounted) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User added successfully!")),
            );
            if (mounted) Navigator.pop(context);
          } else if (state is AddUserStateErrorState) {
            if (mounted) Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
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
                onPressed: _submitForm,
                child: const Text("Send"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
