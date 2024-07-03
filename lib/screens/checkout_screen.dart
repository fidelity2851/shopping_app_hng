import 'package:flutter/material.dart';
import 'package:shopping_app_hng/screens/order_success_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> checkoutList;
  final Function removeFromCheckout;
  final Function clearCheckout;
  const CheckoutScreen({
    super.key,
    required this.checkoutList,
    required this.removeFromCheckout,
    required this.clearCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return checkoutList.isNotEmpty
        ? Column(
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
                          Image(
                            image:
                                NetworkImage('${checkoutList[index]['image']}'),
                            width: 100.0,
                            height: 100.0,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${checkoutList[index]['name']}',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${checkoutList[index]['price']}',
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  removeFromCheckout(checkoutList[index]);
                                },
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 15.0,
                                  )),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
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
                  // Clear Checkout Before Redirect
                  clearCheckout();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderSuccessSreen()),
                  );
                },
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
          )
        : const Center(
            child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'No Record Found',
              style: TextStyle(
                color: Color(0xFF8E3B38),
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ));
  }
}
