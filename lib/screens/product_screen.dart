import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

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
    );
  }
}
