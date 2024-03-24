import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/providers/activescreen_provider.dart';
import 'package:travel_app/screens/tab/screen/tab_based_navbar.dart';
import 'package:travel_app/settings/colors.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

Map<String, String> allCategories = {};
Map<String, String> hotCategories = {};
List<Place> availablePlaces = [];

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadCategories();
    loadPlaces();
    loadHotCategories();

    Future.delayed(const Duration(seconds: 3), () {
      ref
          .read(activeScreenProvider.notifier)
          .setScreen('home', allCategories, availablePlaces, hotCategories);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabScreen(
            allCategories: allCategories,
            availablePlaces: availablePlaces,
            hotCategories: hotCategories,
          ),
        ),
      );
    });
  }

  void loadCategories() async {
    final url = Uri.https(
        'flutter-travel-ff615-default-rtdb.firebaseio.com', 'categories.json');
    final response = await http.get(url);
    final Map<String, dynamic> categoriesData = json.decode(response.body);
    Map<String, String> loadedCategories = {};

    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (final category in categoriesData.entries) {
        loadedCategories = {
          ...loadedCategories,
          category.key: category.value['icon']
        };
      }

      setState(() {
        allCategories = loadedCategories;
      });
    }
  }

  void loadHotCategories() async {
    final url = Uri.https('flutter-travel-ff615-default-rtdb.firebaseio.com',
        'hotCategories.json');
    final response = await http.get(url);
    final Map<String, dynamic> categories = json.decode(response.body);
    Map<String, String> loadedCategories = {};

    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (final category in categories.entries) {
        loadedCategories = {
          ...loadedCategories,
          category.key: category.value['icon']
        };
      }

      setState(() {
        hotCategories = loadedCategories;
      });
    }
  }

  void loadPlaces() async {
    final url = Uri.https(
        'flutter-travel-ff615-default-rtdb.firebaseio.com', 'places.json');
    final response = await http.get(url);
    final Map<String, dynamic> placesData = json.decode(response.body);
    List<Place> loadedPlacesList = [];

    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (final place in placesData.entries) {
        loadedPlacesList.add(
          Place(
            name: place.key,
            location: place.value['location'],
            latitude: place.value['latitude'],
            longitude: place.value['longitude'],
            description: place.value['description'],
            categories: place.value['categories'],
            rating: place.value['rating'],
            image: place.value['image'],
            reviews: place.value['reviews'],
          ),
        );
      }
      setState(() {
        availablePlaces = loadedPlacesList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: BoxDecoration(
        gradient: primaryGradient,
      ),
      child: Center(
        child: Hero(
          tag: 'splash-logo',
          child: Image.asset('assets/images/splash_logo.png'),
        ),
      ),
    );
  }
}

final availablePlacesProvider = Provider((ref) {
  return availablePlaces;
});
