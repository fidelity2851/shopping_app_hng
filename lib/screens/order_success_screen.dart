import 'package:flutter/material.dart';

class OrderSuccessSreen extends StatelessWidget {
  const OrderSuccessSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your order has been placed successfully!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[700],
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 30.0,
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
                  'Back to Products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.popUntil(
                      context, (Route<dynamic> predicate) => predicate.isFirst);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
