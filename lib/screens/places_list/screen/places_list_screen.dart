import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/screens/places_list/widgets/place_list_item.dart';
import 'package:travel_app/screens/splash/splash_screen.dart';

class PlacesListScreen extends ConsumerStatefulWidget {
  const PlacesListScreen({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  ConsumerState<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends ConsumerState<PlacesListScreen> {
  List<Place> filteredPlaces = [];
  @override
  Widget build(BuildContext context) {
    List<Place> availablePlaces = ref.watch(availablePlacesProvider);

    availablePlaces = availablePlaces
        .where((element) => element.categories.contains(widget.categoryName))
        .toList();

    Widget content = const Center(
      child: Text('No Places yet. Please try to select different category'),
    );

    if (availablePlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: availablePlaces.length,
        itemBuilder: (context, index) =>
            PlaceListItem(place: availablePlaces[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: content,
    );
  }
}
