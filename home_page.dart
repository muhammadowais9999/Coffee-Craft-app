import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage widget
import 'menu_page.dart'; // Import the MenuPage widget
import 'cart_page.dart'; // Import the CartPage widget
import 'profile_page.dart'; // Import the ProfilePage widget

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CoffeeCraft',
          style: TextStyle(
            color: Colors.white, // White text color
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 70, 66, 19), // Same color as LoginPage
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, // White color for drawer icon
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 70, 66, 19), // Same color as LoginPage
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/logoapp.png'), // Profile image
                  ),
                  SizedBox(height: 16),
                  Text(
                    'User Name', // You can fetch the user's name dynamically
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Color.fromARGB(255, 70, 66, 19)), // Same color as LoginPage
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: Color.fromARGB(255, 70, 66, 19)), // Same color as LoginPage
              title: Text('My Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: []), // Pass the cart items here
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Color.fromARGB(255, 70, 66, 19)), // Same color as LoginPage
              title: Text('Favorite'),
              onTap: () {
                // Navigate to Favorite Page
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback, color: Color.fromARGB(255, 70, 66, 19)), // Same color as LoginPage
              title: Text('Feedback'),
              onTap: () {
                // Navigate to Feedback Page
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Color.fromARGB(255, 70, 66, 19)), // Same color as LoginPage
              title: Text('Notifications'),
              onTap: () {
                // Navigate to Notifications Page
              },
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Color.fromARGB(255, 249, 249, 249), // Same background color as LoginPage
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * 0.9, // 90% of the screen width
                  ),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color.fromARGB(255, 255, 253, 234), // Same card color as LoginPage
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Welcome to CoffeeCraft!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color.fromARGB(255, 45, 45, 45), // Dark text color for heading
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MenuPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 70, 66, 19), // Same button color as LoginPage
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Order Now!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white, // Button text color
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
