import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final List<Map<String, dynamic>> productList;
  final List<Map<String, dynamic>> checkoutList;
  final Function addToCheckout;
  const ProductScreen({
    super.key,
    required this.productList,
    required this.checkoutList,
    required this.addToCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: productList.length,
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
                      image: AssetImage('${productList[index]['image']}'),
                      width: 100.0,
                      height: 100.0,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productList[index]['name'],
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${productList[index]['price']}',
                            style: const TextStyle(
                              color: Colors.amber,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          checkoutList.contains(productList[index])
                              ? ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    )),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color(0xFF2A2927)),
                                    shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Added',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    addToCheckout(productList[index]);
                                  },
                                  style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 15.0,
                                    )),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color(0xFFC09000)),
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
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
