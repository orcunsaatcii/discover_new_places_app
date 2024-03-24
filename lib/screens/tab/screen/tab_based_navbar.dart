import 'package:flutter/material.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/providers/activescreen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/screens/splash/splash_screen.dart';
import 'package:travel_app/settings/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen(
      {super.key,
      required this.allCategories,
      required this.availablePlaces,
      required this.hotCategories});

  final Map<String, String> allCategories;
  final Map<String, String> hotCategories;
  final List<Place> availablePlaces;

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = ref.watch(activeScreenProvider);
    int currentIndex = ref.watch(currentIndexProvider);

    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: (activeScreen is SplashScreen)
          ? null
          : CurvedNavigationBar(
              animationCurve: Curves.fastLinearToSlowEaseIn,
              height: 60,
              color: secondaryColor.withOpacity(0.8),
              index: currentIndex,
              backgroundColor: backgroundColor,
              items: const [
                Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.travel_explore,
                  size: 30,
                  color: Colors.blueAccent,
                ),
                Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.red,
                ),
              ],
              onTap: (value) {
                ref.read(activeScreenProvider.notifier).setScreen(
                    (value == 0)
                        ? 'home'
                        : (value == 1)
                            ? 'discover'
                            : 'favorites',
                    widget.allCategories,
                    widget.availablePlaces,
                    widget.hotCategories);
                ref.read(currentIndexProvider.notifier).setCurrentIndex(
                      (value == 0)
                          ? 'home'
                          : (value == 1)
                              ? 'discover'
                              : 'favorites',
                    );
              },
            ),
    );
  }
}
