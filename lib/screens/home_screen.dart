import 'package:flutter/material.dart';
import 'package:shopping_app_hng/screens/checkout_screen.dart';
import 'package:shopping_app_hng/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Current Screen
  int _selectScreenIndex = 0;

// Product List
  final List<Map<String, dynamic>> _productList = [
    {
      'name': 'Apple AirPods Pro',
      'price': 249,
      'image': 'assets/product1.jpg',
    },
    {
      'name': 'Samsung Galaxy S21 Ultra',
      'price': 1199,
      'image': 'assets/product2.jpg',
    },
    {
      'name': 'Sony WH-1000XM4',
      'price': 348,
      'image': 'assets/product3.jpg',
    },
    {
      'name': 'Nintendo Switch',
      'price': 299,
      'image': 'assets/product4.jpg',
    },
    {
      'name': 'Xiaomi Redmi Note 13 PRO 5G + 4G LTE (256GB + 8GB)',
      'price': 289,
      'image': 'assets/product5.jpg',
    },
  ];

// Checkout List
  final List<Map<String, dynamic>> _checkoutList = [];

// Screen Navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  // Add To Checkout
  void _addToCheckout(Map<String, dynamic> product) {
    setState(() {
      _checkoutList.add(product);
    });
  }

  // Remove From Checkout
  void _removeFromCheckout(Map<String, dynamic> product) {
    setState(() {
      _checkoutList.remove(product);
    });
  }

  // Clear Checkout List
  void _clearCheckout() {
    setState(() {
      _checkoutList.clear();
      _selectScreenIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ProductScreen(
        productList: _productList,
        checkoutList: _checkoutList,
        addToCheckout: _addToCheckout,
      ),
      CheckoutScreen(
        checkoutList: _checkoutList,
        removeFromCheckout: _removeFromCheckout,
        clearCheckout: _clearCheckout,
      ),
    ];

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
      body: SingleChildScrollView(child: screens[_selectScreenIndex]),
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
