import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Color.fromARGB(255, 70, 66, 19),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Favorite Item 1'),
            subtitle: Text('Description of item 1'),
            leading: Icon(Icons.favorite, color: Colors.red),
          ),
          Divider(), // Horizontal line
          ListTile(
            title: Text('Favorite Item 2'),
            subtitle: Text('Description of item 2'),
            leading: Icon(Icons.favorite, color: Colors.red),
          ),
          Divider(), // Horizontal line
          ListTile(
            title: Text('Favorite Item 3'),
            subtitle: Text('Description of item 3'),
            leading: Icon(Icons.favorite, color: Colors.red),
          ),
          Divider(), // Horizontal line
          ListTile(
            title: Text('Favorite Item 4'),
            subtitle: Text('Description of item 4'),
            leading: Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
