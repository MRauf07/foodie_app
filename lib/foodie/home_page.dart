import 'package:flutter/material.dart';
import 'package:foodie_app/foodie/food_detail.dart';
import 'package:foodie_app/foodie/order_history_page.dart';

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({super.key});

  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  int _cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Foodie Delights',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 28,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderHistoryPage()),
                  );
                },
              ),
              if (_cartCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$_cartCount',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildTopSlider(),
            const SizedBox(height: 20),
            _buildCategoryChips(),
            const SizedBox(height: 20),
            _buildFoodGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSlider() {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Hero(
            tag: 'food_slider_$index',
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/pitza$index.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _buildCategoryChip('Pizza'),
          const SizedBox(width: 10),
          _buildCategoryChip('Burger'),
          const SizedBox(width: 10),
          _buildCategoryChip('Pasta'),
          const SizedBox(width: 10),
          _buildCategoryChip('Salad'),
          const SizedBox(width: 10),
          _buildCategoryChip('Dessert'),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Chip(
      side: BorderSide.none,
      label: Text(
        label,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.orange,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    );
  }

  Widget _buildFoodGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.78,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FoodDetailPage(index: index, addToCart: _addToCart),
              ),
            );
          },
          child: Hero(
            tag: 'food_card_$index',
            child: _buildFoodCard(index),
          ),
        );
      },
    );
  }

  Widget _buildFoodCard(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              'assets/pitza$index.png',
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delicious Food $index',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text('A tasty dish you will love!',
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                Text(
                  '\$${(index + 1) * 5}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
  }
}
