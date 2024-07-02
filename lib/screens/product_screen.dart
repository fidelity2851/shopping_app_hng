import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List productList = [1, 1, 1, 1, 1, 1, 1, 1];

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
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 15.0,
              left: 15.0,
            ),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: NetworkImage('https://placehold.jp/150x150.png'),
                    width: 100.0,
                    height: 100.0,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Product 1',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        '\$100',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('Add');
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 15.0,
                          )),
                          backgroundColor:
                              const MaterialStatePropertyAll(Color(0xFFC09000)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        iconSize: 30.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: 'PRODUCTS',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
            ),
            label: 'CHECKOUT',
          ),
        ],
      ),
    );
  }
}
