import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/models/place.dart';
import 'package:travel_app/providers/favorite_places_provider.dart';
import 'package:travel_app/screens/place_detail/widgets/add_comment.dart';
import 'package:travel_app/settings/colors.dart';

class PlaceTraitItem extends ConsumerWidget {
  const PlaceTraitItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> favoritePlaces = ref.watch(favoritePlacesProvider);
    final bool isPlaceFavorite = favoritePlaces.contains(place);
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: secondaryColor),
        boxShadow: const [
          BoxShadow(
            color: secondaryColor,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    ref
                        .read(favoritePlacesProvider.notifier)
                        .togglePlace(place);
                  },
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      isPlaceFavorite ? Icons.favorite : Icons.favorite_border,
                      key: ValueKey(isPlaceFavorite),
                      color: Colors.red,
                      size: 35,
                    ),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                  ),
                ),
                Text(
                  'Save',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const AddComment(),
                    );
                  },
                  icon: const Icon(
                    Icons.add_comment,
                    size: 35,
                    color: Colors.lightBlue,
                  ),
                ),
                Text(
                  'Comment',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star_outlined,
                  size: 35,
                  color: Colors.yellow,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  place.rating.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
