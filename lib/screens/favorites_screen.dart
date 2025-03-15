// screens/favorites_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/food_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // Create a local list of favorites based on mockFoodItems.
  List<FoodItem> favorites = List.from(mockFoodItems);

  void removeFavorite(int index) {
    setState(() {
      favorites.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removed from favorites'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void addFavorite(FoodItem item) {
    setState(() {
      favorites.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to favorites'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          return ListTile(
            leading: Image.asset(item.imageUrl),
            title: Text(item.name),
            subtitle: Text('\$${item.price}'),
            // TODO: Add remove from favorites button(yousef mohamed)

            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => removeFavorite(index),
            ),
          );
        },
      ),
    );
  }
}
