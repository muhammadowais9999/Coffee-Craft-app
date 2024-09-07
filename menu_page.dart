import 'package:flutter/material.dart';
import 'cart_page.dart'; // Import the CartPage widget

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<Map<String, dynamic>> cartItems = [];
  final Set<String> favoriteItems = {}; // Set to track favorite items

  void _addToCart(String itemName, String imagePath, double price) {
    setState(() {
      cartItems.add({
        'name': itemName,
        'imagePath': imagePath,
        'price': price,
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$itemName added to cart!')),
    );
  }

  void _toggleFavorite(String itemName) {
    setState(() {
      if (favoriteItems.contains(itemName)) {
        favoriteItems.remove(itemName);
      } else {
        favoriteItems.add(itemName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CoffeeCraft',
          style: TextStyle(
            color: Colors.white, // Set title color to white
            fontWeight: FontWeight.bold, // Make title bold
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 70, 66, 19),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Set back arrow color to white
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white, // Set cart icon color to white
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4, // Adjust the aspect ratio for proper size
          ),
          children: <Widget>[
            _buildCoffeeItem('Cappuccino', 'assets/coffee1.png', 3.50),
            _buildCoffeeItem('Americano', 'assets/coffee2.png', 3.00),
            _buildCoffeeItem('Latte', 'assets/coffee3.png', 4.00),
            _buildCoffeeItem('Caffè Mocha', 'assets/coffee4.png', 4.50),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeItem(String name, String imagePath, double price) {
    final isFavorite = favoriteItems.contains(name);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 120, // Smaller height for image
                  width: double.infinity,
                  fit: BoxFit.cover, // Make sure the image fits properly
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    _toggleFavorite(name);
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _addToCart(name, imagePath, price);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 70, 66, 19), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
