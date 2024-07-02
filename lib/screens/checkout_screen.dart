import 'package:flutter/material.dart';
import 'package:shopping_app_hng/screens/order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List checkoutList = [1, 1, 1, 1, 1, 1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: checkoutList.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
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
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 192, 38, 0)),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Remove',
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
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderSuccessSreen()),
            );
          },
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 30.0,
            )),
            backgroundColor: const MaterialStatePropertyAll(Color(0xFFC09000)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: const Text(
            'Confirm Order',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
