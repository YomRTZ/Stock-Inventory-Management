import 'package:stock_inventory_management/src/presentation/forms/add_user_profile.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/presentation/components/user_profile_card.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_event.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_state.dart';

class SupplierProfilePage extends StatefulWidget {
  const SupplierProfilePage({super.key});

  @override
  State<SupplierProfilePage> createState() => _SupplierProfilePageState();
}

class _SupplierProfilePageState extends State<SupplierProfilePage> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Supplier Profiles")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserSuccessState) {
            return ListView.builder(
              itemCount: state.userData.length,
              itemBuilder: (context, index) {
                final dataItems = state.userData[index];
                return UserProfileCard(
                  name: dataItems.name,
                  email: dataItems.email,
                  phone: dataItems.phone,
                  address: dataItems.address,
                );
              },
            );
          }
          return const Center(child: Text("No user found."));
        },
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUser()),
          );
        },
        backgroundColor: const Color(0xFFCE7128),
        child: const Icon(Icons.add),
      ),
    );
  }
}
