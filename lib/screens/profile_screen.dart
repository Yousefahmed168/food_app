// screens/profile_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // ✅ TODO: Create profile header with avatar (shahd mohamed)
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 16),

            // ✅ TODO: Add user information section (shahd mohamed)
            const Text('John Doe', style: AppTextStyles.heading1),
            const Text(
              'john@example.com',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 32),

            // ✅ TODO: Create settings list tiles (shahd mohamed)
            const SettingsTile(
              icon: Icons.history,
              title: 'Order History',
              subtitle: 'View your previous orders',
            ),
            const Divider(),
            const SettingsTile(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'Manage your account settings',
            ),
            const Divider(),
            const SettingsTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Get assistance with issues',
            ),
            const Divider(),

            SettingsTile(
              icon: Icons.logout,
              title: 'Logout',
              subtitle: 'Sign out of your account',
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  static void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully!')),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
