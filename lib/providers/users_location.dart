import 'dart:io';

import 'package:fav_location/models/location.dart';
import 'package:riverpod/riverpod.dart';

class UserLocationNotifier extends StateNotifier<List<Location>> {
  UserLocationNotifier() : super(const []);

  void addPlace(String title, File image) {
    final newLocation = Location(title: title, image: image);
    state = [newLocation, ...state];
  }
}

final userLocationProvider =
    StateNotifierProvider<UserLocationNotifier, List<Location>>(
        (ref) => UserLocationNotifier());
