
import 'package:flutter/material.dart';
import 'package:foodie_app/foodie/order_success_page.dart';

class FoodDetailPage extends StatelessWidget {

  final int index;
  final VoidCallback addToCart;
  const FoodDetailPage({super.key, required this.index, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white)),
        title: const Text('Food Details',style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'food_card_$index',
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage('assets/pitza$index.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delicious Food $index',
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'A delicious dish you will love with lots of flavors and a perfect balance of ingredients. A treat for your taste buds!',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Add Ons',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildOptionChip('Extra Cheese'),
                          _buildOptionChip('Mushrooms'),
                          _buildOptionChip('Olives'),
                          _buildOptionChip('Peppers'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${(index + 1) * 5}',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              addToCart();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const OrderSuccessPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: Colors.orange,
                            ),
                            child: const Text(
                              'Place Order',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /*Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Lottie.asset(
              'assets/celebration.json',
              height: 200,
              repeat: false,
              animate: true,
            ),
          ),*/
        ],
      ),
    );
  }

  Widget _buildOptionChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.orange[100],
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}
