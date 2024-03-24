import 'package:flutter/material.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/screens/place_detail/screen/place_detail_screen.dart';
import 'package:travel_app/settings/colors.dart';

class HomePagePlaceItem extends StatelessWidget {
  const HomePagePlaceItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(place: place),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        width: 280,
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: secondaryColor,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: place.name,
                    child: Image.asset(
                      place.image,
                      scale: 5,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  place.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      place.location,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                    ),
                    Text(
                      place.rating.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
