import 'package:flutter/widgets.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/screens/home/widgets/homepage_place_item.dart';

class HomePagePlaces extends StatelessWidget {
  const HomePagePlaces({super.key, required this.availablePlaces});

  final List<Place> availablePlaces;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availablePlaces.length,
        itemBuilder: (context, index) =>
            HomePagePlaceItem(place: availablePlaces[index]),
      ),
    );
  }
}
