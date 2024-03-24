import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/providers/favorite_places_provider.dart';
import 'package:travel_app/screens/places_list/widgets/place_list_item.dart';

class FavoritePlacesScreen extends ConsumerWidget {
  const FavoritePlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> favoritePlaces = ref.watch(favoritePlacesProvider);

    Widget content = const Center(
      child: Text('No favorite places yet.'),
    );

    if (favoritePlaces.isNotEmpty) {
      content = ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) => PlaceListItem(
          place: favoritePlaces[index],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: content,
    );
  }
}
