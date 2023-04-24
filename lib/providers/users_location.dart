import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:fav_location/models/location.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class UserLocationNotifier extends StateNotifier<List<Place>> {
  UserLocationNotifier() : super(const []);
  Future<Database> _getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_place(id TEXT PRIMARY KEY,title TEXT,image TEXT,location TEXT,lat REAL,lon REAL,lng REAL,address TEXT);');
      },
      version: 1,
    );
    return db;
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_place');
    final places = data
        .map((row) => Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            location: PlaceLocation(
                latitude: row['lat'] as double,
                longtitude: row['lng'] as double,
                address: row['address'] as String)))
        .toList();

    state = places;
  }

  Future<void> addPlace(
      String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/${filename}');
    final newLocation = Place(title: title, image: image, location: location);
    final db = await _getDatabase();
    db.insert('user_place', {
      'id': newLocation.id,
      'title': newLocation.title,
      'image': newLocation.image.path,
      'lat': newLocation.location.latitude,
      'lng': newLocation.location.longtitude,
      'address': newLocation.location.address
    });
    state = [newLocation, ...state];
  }
}

final userLocationProvider =
    StateNotifierProvider<UserLocationNotifier, List<Place>>(
        (ref) => UserLocationNotifier());
