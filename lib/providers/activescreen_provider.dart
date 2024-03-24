import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/screens/favorites/screen/favorite_places_screen.dart';
import 'package:travel_app/screens/home/screen/home_screen.dart';
import 'package:travel_app/screens/place_category/screen/place_categories_screen.dart';
import 'package:travel_app/screens/splash/splash_screen.dart';

class ActiveScreenNotifier extends StateNotifier<Widget> {
  ActiveScreenNotifier() : super(const SplashScreen());

  void setScreen(String identifier, Map<String, String> allCategories,
      List<Place> availablePlaces, Map<String, String> hotCategories) {
    if (identifier == 'home') {
      state = HomeScreen(
        availablePlaces: availablePlaces,
        hotCategories: hotCategories,
      );
    }
    if (identifier == 'discover') {
      state = PlaceCategoriesScreen(
        allCategories: allCategories,
      );
    }
    if (identifier == 'favorites') {
      state = const FavoritePlacesScreen();
    }
  }
}

final activeScreenProvider =
    StateNotifierProvider<ActiveScreenNotifier, Widget>((ref) {
  return ActiveScreenNotifier();
});

class CurrentIndexNotifier extends StateNotifier<int> {
  CurrentIndexNotifier() : super(0);

  void setCurrentIndex(String identifier) {
    if (identifier == 'home') {
      state = 0;
    }
    if (identifier == 'discover') {
      state = 1;
    }
    if (identifier == 'favorites') {
      state = 2;
    }
  }
}

final currentIndexProvider =
    StateNotifierProvider<CurrentIndexNotifier, int>((ref) {
  return CurrentIndexNotifier();
});
