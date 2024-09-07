import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;
  final _nameController = TextEditingController(text: 'User Name');
  final _phoneController = TextEditingController(text: '123-456-7890');
  final _emailController = TextEditingController(text: 'user.email@example.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Color.fromARGB(255, 70, 66, 19), // Same color as LoginPage
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = true;
                });
              },
            ),
          if (_isEditing)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                // Handle save action here
                setState(() {
                  _isEditing = false;
                });
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_picture.png'), // Profile image
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              readOnly: !_isEditing,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                suffixIcon: _isEditing
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _nameController.clear();
                        },
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              readOnly: !_isEditing,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                suffixIcon: _isEditing
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _phoneController.clear();
                        },
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              readOnly: !_isEditing,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                suffixIcon: _isEditing
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _emailController.clear();
                        },
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 30),
            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  // Handle save action here
                  setState(() {
                    _isEditing = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 70, 66, 19), // Same button color
                ),
                child: const Text('Save'),
              ),
            if (!_isEditing)
              ElevatedButton(
                onPressed: () {
                  // Handle logout action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 70, 66, 19), // Same button color
                ),
                child: const Text('Logout'),
              ),
          ],
        ),
      ),
    );
  }
}
