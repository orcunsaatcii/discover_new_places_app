import 'package:flutter/material.dart';
import 'package:travel_app/screens/places_list/screen/places_list_screen.dart';
import 'package:travel_app/settings/colors.dart';

class HotCategoryItem extends StatelessWidget {
  const HotCategoryItem({super.key, required this.category});

  final MapEntry<String, String> category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlacesListScreen(categoryName: category.key),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(190),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: secondaryColor,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Image.asset(
                category.value,
                scale: 10,
              ),
            ),
            Positioned(
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: secondaryColor,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: secondaryColor,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    category.key,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
