import 'package:fav_location/providers/users_location.dart';
import 'package:fav_location/screens/addLoction.dart';
import 'package:fav_location/widgets/location_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Locations extends ConsumerWidget {
  const Locations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLocationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your location"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => AddLocation()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: LocationList(
        locations: userLocation,
      ),
    );
  }
}
