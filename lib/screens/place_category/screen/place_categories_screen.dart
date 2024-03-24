import 'package:flutter/material.dart';
import 'package:travel_app/screens/place_category/widgets/place_category_item.dart';

class PlaceCategoriesScreen extends StatefulWidget {
  const PlaceCategoriesScreen({super.key, required this.allCategories});

  final Map<String, String> allCategories;

  @override
  State<PlaceCategoriesScreen> createState() => _PlaceCategoriesScreenState();
}

class _PlaceCategoriesScreenState extends State<PlaceCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('Reinforcement...'),
    );

    if (widget.allCategories.isNotEmpty) {
      content = GridView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for (var category in widget.allCategories.entries)
            PlaceCategoryItem(categoryName: category),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: content,
    );
  }
}
