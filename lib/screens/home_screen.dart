import 'package:flutter/material.dart';
import 'package:food_app/utils/constants.dart';
// Ensure you have a FoodCard widget defined elsewhere.
import '../widgets/food_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = 'All';
  List<String> categories = ['All', 'Pizza', 'Burgers', 'Sushi', 'Desserts'];

  List<Map<String, String>> allFoodItems = [
    {'name': 'Margherita Pizza', 'category': 'Pizza'},
    {'name': 'Pepperoni Pizza', 'category': 'Pizza'},
    {'name': 'Cheeseburger', 'category': 'Burgers'},
    {'name': 'Chicken Burger', 'category': 'Burgers'},
    {'name': 'Salmon Sushi', 'category': 'Sushi'},
    {'name': 'Chocolate Cake', 'category': 'Desserts'},
  ];

  // Initialize filteredFoodItems with all food items.
  List<Map<String, String>> filteredFoodItems = [];

  @override
  void initState() {
    super.initState();
    filteredFoodItems = List.from(allFoodItems);
  }

  void filterItems() {
    setState(() {
      filteredFoodItems = allFoodItems.where((food) {
        final matchesCategory =
            selectedCategory == 'All' || food['category'] == selectedCategory;
        final matchesSearch = food['name']!
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery'),
        // TODO: Add search bar widget here(yousef mohamed)
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) => filterItems(),
              decoration: InputDecoration(
                hintText: 'search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            const SizedBox(height: 10),
            // TODO: Create horizontal scrollable category chips(yousef mohamed)
            SizedBox(
              height: 150,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mockFoodItems.length,
                itemBuilder: (context, index) {
                  final item = mockFoodItems[index];
                  return FoodCard(
                    item: item,
                    category: item.category,
                    name: item.name,
                  );
                },
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = category;
                          filterItems();
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            // TODO: Build vertical list of food items using ListView.separated(yousef ahmed)
            Expanded(
              child: filteredFoodItems.isEmpty
                  ? const Center(child: Text("لا توجد أطعمة متاحة"))
                  // TODO: Implement food item list(yousef ahmed)
                  : ListView.separated(
                      itemCount: filteredFoodItems.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final food = filteredFoodItems[index];
                        return ListTile(
                          title: Text(food['name']!),
                          subtitle: Text("الفئة: ${food['category']}"),
                          trailing: const Icon(
                            Icons.fastfood,
                            color: Colors.orange,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
