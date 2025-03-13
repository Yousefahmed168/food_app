// screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Column(
        children: [
          // TODO: Create profile header with avatar
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          // TODO: Add user information section
          Text('John Doe', style: AppTextStyles.heading1),
          Text('john@example.com'),
          // TODO: Create settings list tiles
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Order History'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}