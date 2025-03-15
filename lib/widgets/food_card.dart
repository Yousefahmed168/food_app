// widgets/food_card.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/screens/item_details_screen.dart';
import '../models/food_item.dart';
import '../screens/favorites_screen.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;

  const FoodCard(
      {super.key,
      required this.item,
      required String category,
      required String name});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the food item's details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailsScreen(item: item),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            // TODO: Implement image with rounded corners (yousef ahmed)
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                item.imageUrl,
                width: 120,
                height: double.infinity,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(179, 91, 59, 198),
                    ),
                  ),
                  Text(
                    '\$${item.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(219, 16, 118, 227),
                    ),
                  ),
                  // TODO: Add rating row (yousef ahmed)
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        case 1:
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        case 2:
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        case 3:
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        case 4:
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        default:
                          return const Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                      }
                    },
                    onRatingUpdate: (rating) {
                      if (kDebugMode) {
                        print(rating);
                      }
                    },
                  ),
                  // TODO: Add favorite icon button (yousef ahmed)
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      // Add item to favorites
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavoritesScreen(),
                        ),
                      ).then((_) {
                        // ignore: use_build_context_synchronously
                        final favoritesScreenState = context
                            .findAncestorStateOfType<_FavoritesScreenState>();
                        if (favoritesScreenState != null) {
                          favoritesScreenState.addFavorite(item);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void addFavorite(FoodItem item) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
