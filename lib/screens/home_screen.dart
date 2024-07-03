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
      'image': 'https://m.media-amazon.com/images/I/71zny7BTRlL._AC_SX679_.jpg'
    },
    {
      'name': 'Samsung Galaxy S21 Ultra',
      'price': 1199,
      'image':
          'https://m.media-amazon.com/images/I/71hmici6DyL.__AC_SX300_SY300_QL70_FMwebp_.jpg'
    },
    {
      'name': 'Sony WH-1000XM4',
      'price': 348,
      'image': 'https://m.media-amazon.com/images/I/71o8Q5XJS5L._AC_SX679_.jpg'
    },
    {
      'name': 'Nintendo Switch',
      'price': 299,
      'image': 'https://m.media-amazon.com/images/I/61-PblYntsL._AC_SX679_.jpg'
    },
    {
      'name': 'Xiaomi Redmi Note 13 PRO 5G + 4G LTE (256GB + 8GB)',
      'price': 289,
      'image': 'https://m.media-amazon.com/images/I/41GK+ItincL._AC_SX679_.jpg'
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
