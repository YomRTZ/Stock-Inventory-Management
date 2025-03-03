import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_inventory_management/src/getIt/get_it.dart';
import 'package:stock_inventory_management/src/presentation/pages/home_screen.dart';
import 'package:stock_inventory_management/src/states/blocs/customer/customer_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/user/user_bloc.dart';
import 'package:stock_inventory_management/src/states/blocs/product/product_bloc.dart';

void main() {
  getitSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => getIt<UserBloc>()),
        BlocProvider<ProductBloc>(create: (context) => getIt<ProductBloc>()),
        BlocProvider<CustomerBloc>(create: (context) => getIt<CustomerBloc>()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // Ensures taps work anywhere on screen
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/backgroundimage.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Image.asset(
                  'images/Yegna-Trading-Logo.png',
                  width: 200.0,
                  height: 200.0,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                label: const Text('Click'),
                icon: const Icon(Icons.arrow_right),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
