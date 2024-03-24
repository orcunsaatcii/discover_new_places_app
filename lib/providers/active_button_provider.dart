import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ActiveButton { all, popular, recommended, mostViewed }

class ActiveButtonNotifier extends StateNotifier<ActiveButton> {
  ActiveButtonNotifier() : super(ActiveButton.all);

  void setActiveButton(ActiveButton button) {
    state = button;
  }
}

final activeButtonProvider =
    StateNotifierProvider<ActiveButtonNotifier, ActiveButton>((ref) {
  return ActiveButtonNotifier();
});
