import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../utils/constants.dart';

class ItemDetailsScreen extends StatelessWidget {
  final FoodItem item;

  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Details')),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(item.imageUrl, fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: Create rating widget with stars(shahd mohamed)
                    const RatingWidget(rating: 4.5),
                    const SizedBox(height: 8),
                    Text(item.name, style: AppTextStyles.heading1),
                    const SizedBox(height: 8),
                    Text('\$${item.price}', style: AppTextStyles.priceText),
                    const SizedBox(height: 16),

                    //// TODO: Add ingredient list section(shahd mohamed)
                    const Text(
                      'Ingredients:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...item.ingredients.map(
                      (ingredient) => Text('- $ingredient'),
                    ),
                    const SizedBox(height: 16),
                    //TODO: Create quantity selector widget(shahd mohamed)
                    const QuantitySelector(),
                    const SizedBox(height: 16),

                    //TODO: Implement add to cart functionality(shahd mohamed)
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${item.name} added to cart!'),
                          ),
                        );
                      },
                      child: const Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  final double rating;
  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void increment() => setState(() => quantity++);
  void decrement() =>
      setState(() => quantity = quantity > 1 ? quantity - 1 : 1);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: decrement, icon: const Icon(Icons.remove)),
        Text('$quantity', style: const TextStyle(fontSize: 18)),
        IconButton(onPressed: increment, icon: const Icon(Icons.add)),
      ],
    );
  }
}


