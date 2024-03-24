import 'package:flutter/material.dart';
import 'package:travel_app/screens/places_list/screen/places_list_screen.dart';
import 'package:travel_app/settings/colors.dart';

class PlaceCategoryItem extends StatelessWidget {
  const PlaceCategoryItem({super.key, required this.categoryName});

  final MapEntry<String, String> categoryName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlacesListScreen(
              categoryName: categoryName.key,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: secondaryColor,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryName.value,
              scale: 6,
            ),
            const SizedBox(height: 20),
            Text(
              categoryName.key,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
