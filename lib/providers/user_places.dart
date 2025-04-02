import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart'as syspaths;

import '../model/place.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super([]);
  final appDir=syspaths.getApplicationDocumentsDirectory();

  void addPlace(String title,File image) {
    final newPlace = Place(title, image);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlaceNotifier, List<Place>>((ref) => UserPlaceNotifier());
