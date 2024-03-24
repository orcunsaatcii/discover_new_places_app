import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/providers/active_button_provider.dart';
import 'package:travel_app/settings/colors.dart';

class Suggestions extends ConsumerStatefulWidget {
  const Suggestions({super.key});

  @override
  ConsumerState<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends ConsumerState<Suggestions> {
  @override
  Widget build(BuildContext context) {
    ActiveButton activeButton = ref.watch(activeButtonProvider);

    Color clickedColor = secondaryColor;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  (activeButton == ActiveButton.all) ? clickedColor : white,
              shadowColor: secondaryColor,
            ),
            onPressed: () {
              ref
                  .read(activeButtonProvider.notifier)
                  .setActiveButton(ActiveButton.all);
            },
            child: Text('All', style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  (activeButton == ActiveButton.popular) ? clickedColor : white,
              shadowColor: secondaryColor,
            ),
            onPressed: () {
              ref
                  .read(activeButtonProvider.notifier)
                  .setActiveButton(ActiveButton.popular);
            },
            child:
                Text('Popular', style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: (activeButton == ActiveButton.recommended)
                  ? clickedColor
                  : null,
              shadowColor: secondaryColor,
            ),
            onPressed: () {
              ref
                  .read(activeButtonProvider.notifier)
                  .setActiveButton(ActiveButton.recommended);
            },
            child: Text('Recommended',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(width: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: (activeButton == ActiveButton.mostViewed)
                  ? clickedColor
                  : null,
              shadowColor: secondaryColor,
            ),
            onPressed: () {
              ref
                  .read(activeButtonProvider.notifier)
                  .setActiveButton(ActiveButton.mostViewed);
            },
            child: Text('Most Viewed',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
