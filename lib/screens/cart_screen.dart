// screens/cart_screen.dart
import 'package:flutter/material.dart';
import '../utils/constants.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Classic Burger',
      'price': 12.99,
      'imageUrl': 'assets/burger.jpg',
      'quantity': 1,
    },
    {
      'name': 'Margherita Pizza',
      'price': 14.99,
      'imageUrl': 'assets/pizza.jpg',
      'quantity': 1,
    },
    {
      'name': 'California Sushi Roll',
      'price': 18.50,
      'imageUrl': 'assets/sushi.jpg',
      'quantity': 1,
    },
    {
      'name': 'Chicken Caesar Salad',
      'price': 10.99,
      'imageUrl': 'assets/salad.jpg',
      'quantity': 1,
    },
    

  ];

  void updateQuantity(int index, int value) {
    setState(() {
      cartItems[index]['quantity'] += value;
    });
  }


  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double getTotalPrice() {
    return cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = mockFoodItems[index];
                return ListTile(
                  leading: Image.asset(item.imageUrl),
                  title: Text(item.name),
                  subtitle: Text('\$${item.price}'),
                  // TODO: Add quantity selector(yousef mohamed)

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => updateQuantity(index, -1),
                      ),
                        Text('${cartItems[index]['quantity']}', style: const TextStyle(fontSize: 18)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => updateQuantity(index, 1),

                      ),
                      // TODO: Add remove item button(yousef mohamed)
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // TODO: Create checkout section with total price(yousef mohamed)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${getTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 18),
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
