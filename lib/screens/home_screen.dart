import 'package:flutter/material.dart';
import 'package:shopping_app_hng/screens/checkout_screen.dart';
import 'package:shopping_app_hng/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectScreenIndex = 0;
  final List<Widget> _screens = const [ProductScreen(), CheckoutScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping App',
          style: TextStyle(
            fontSize: 30.00,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(child: _screens[_selectScreenIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectScreenIndex,
        selectedItemColor: Colors.amber,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        iconSize: 30.0,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'PRODUCTS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'CHECKOUT',
          ),
        ],
      ),
    );
  }
}
