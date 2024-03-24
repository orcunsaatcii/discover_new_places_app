import 'package:flutter/material.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/screens/place_detail/screen/place_detail_screen.dart';
import 'package:travel_app/settings/colors.dart';

class PlaceListItem extends StatelessWidget {
  const PlaceListItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceDetailScreen(place: place),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Hero(
                tag: place.name,
                child: FadeInImage(
                  width: double.infinity,
                  placeholder:
                      const AssetImage('assets/images/bg_placeholder.jpg'),
                  image: AssetImage(place.image),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        place.name,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.white,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: secondaryColor),
                          Text(
                            place.location,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                          ),
                          Text(
                            place.rating.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
