import 'package:fav_location/models/location.dart';
import 'package:riverpod/riverpod.dart';

class UserLocationNotifier extends StateNotifier<List<Location>> {
  UserLocationNotifier() : super(const []);

  void addPlace(String title) {
    final newLocation = Location(title: title);
    state = [newLocation, ...state];
  }
}

final userLocationProvider =
    StateNotifierProvider((ref) => UserLocationNotifier());
