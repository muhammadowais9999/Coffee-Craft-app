import 'package:flutter/material.dart';
import 'checkout_page.dart'; // Import the CheckoutPage widget

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Map<String, Map<String, dynamic>> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = _groupItems(List.from(widget.cartItems)); // Group items
  }

  Map<String, Map<String, dynamic>> _groupItems(List<Map<String, dynamic>> items) {
    final groupedItems = <String, Map<String, dynamic>>{};
    for (final item in items) {
      final name = item['name'];
      if (groupedItems.containsKey(name)) {
        groupedItems[name]!['quantity'] += 1;
        groupedItems[name]!['totalPrice'] += item['price'];
      } else {
        groupedItems[name] = {
          'imagePath': item['imagePath'],
          'name': item['name'],
          'price': item['price'],
          'quantity': 1,
          'totalPrice': item['price'],
        };
      }
    }
    return groupedItems;
  }

  void _updateQuantity(String name, int quantity) {
    setState(() {
      if (quantity <= 0) {
        cartItems.remove(name);
      } else {
        cartItems[name]!['quantity'] = quantity;
        cartItems[name]!['totalPrice'] = cartItems[name]!['price'] * quantity;
      }
    });
  }

  void _removeItem(String name) {
    setState(() {
      cartItems.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.values.fold(
      0,
      (sum, item) => sum + item['totalPrice'],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.white, // Set the text color to white
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 70, 66, 19),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // White back button
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cartItems.isEmpty
            ? _buildEmptyCartMessage()
            : _buildCartList(),
      ),
      bottomNavigationBar: _buildCheckoutSection(context),
    );
  }

  Widget _buildEmptyCartMessage() {
    return Center(
      child: Text(
        'Your cart is empty!',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems.values.toList()[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: Image.asset(
              item['imagePath'],
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(
              item['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Text('\$${item['price'].toStringAsFixed(2)} x ${item['quantity']}'),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.red),
                  onPressed: () {
                    _updateQuantity(item['name'], item['quantity'] - 1);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: () {
                    _updateQuantity(item['name'], item['quantity'] + 1);
                  },
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close, color: Colors.red),
              onPressed: () {
                _removeItem(item['name']); // Remove item
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckoutSection(BuildContext context) {
    double totalPrice = cartItems.values.fold(
      0,
      (sum, item) => sum + item['totalPrice'],
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 253, 234),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, -2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Total:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set the text color to white
                ),
              ),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 70, 66, 19),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(cartItems: cartItems.values.toList()),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 70, 66, 19),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Proceed to Checkout',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
