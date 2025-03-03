import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/presentation/components/user_profile_card.dart';
import 'package:stock_inventory_management/src/presentation/forms/add_customer.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_event.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_state.dart';

class CustomerProfilePage extends StatefulWidget {
  const CustomerProfilePage({super.key});

  @override
  State<CustomerProfilePage> createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {
   @override
  void initState() {
    BlocProvider.of<CustomerBloc>(context).add(GetCustomerEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customer Profiles")),
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is CustomerLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CustomerSuccessState) {
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
          return const Center(child: Text("No Customer found."));
        },
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCustomer()),
          );
        },
        backgroundColor: const Color(0xFFCE7128),
        child: const Icon(Icons.add),
      ),
    );
  }
}
