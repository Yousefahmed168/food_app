// widgets/food_card.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/screens/item_details_screen.dart';
import '../models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;

  const FoodCard({super.key, required this.item});

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            // TODO: Implement image with rounded corners (yousef ahmed)
            // TODO: Add favorite icon button (yousef ahmed)
            Row(
              children: [
                Image.asset(
                  item.imageUrl,
                  width: 150,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(179, 91, 59, 198),
                        ),
                      ),
                      Text(
                        '\$${item.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(219, 16, 118, 227),
                        ),
                      ),
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
                                Icons.sentiment_very_dissatisfied,
                                color: Colors.red,
                              );
                            case 1:
                              return const Icon(
                                Icons.sentiment_dissatisfied,
                                color: Colors.redAccent,
                              );
                            case 2:
                              return const Icon(
                                Icons.sentiment_neutral,
                                color: Colors.amber,
                              );
                            case 3:
                              return const Icon(
                                Icons.sentiment_satisfied,
                                color: Colors.lightGreen,
                              );
                            case 4:
                              return const Icon(
                                Icons.sentiment_very_satisfied,
                                color: Colors.green,
                              );
                            default:
                              return const Icon(
                                Icons.sentiment_very_satisfied,
                                color: Colors.green,
                              );
                          }
                        },
                        onRatingUpdate: (rating) {
                          if (kDebugMode) {
                            print(rating);
                          }
                        },
                      ),
                      // TODO: Add rating row (yousef ahmed)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
