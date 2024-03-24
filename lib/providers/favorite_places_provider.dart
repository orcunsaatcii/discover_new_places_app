import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/models/place.dart';

class FavoritePlacesNotifier extends StateNotifier<List<Place>> {
  FavoritePlacesNotifier() : super([]);

  void togglePlace(Place place) {
    if (state.contains(place)) {
      print('TEST11111111');
      state = state.where((element) => element.name != place.name).toList();
      print(state);
    } else {
      print('TESt22222222222222222');
      state = [...state, place];
    }
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<Place>>((ref) {
  return FavoritePlacesNotifier();
});
