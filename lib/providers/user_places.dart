import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/place.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super([]);

  void addPlace(String title) {
    final newPlace = Place(title);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>((ref) => UserPlaceNotifier());
