import 'dart:io';

import 'package:fav_location/models/location.dart';
import 'package:riverpod/riverpod.dart';

class UserLocationNotifier extends StateNotifier<List<Place>> {
  UserLocationNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final newLocation = Place(title: title, image: image, location: location);
    state = [newLocation, ...state];
  }
}

final userLocationProvider =
    StateNotifierProvider<UserLocationNotifier, List<Place>>(
        (ref) => UserLocationNotifier());
