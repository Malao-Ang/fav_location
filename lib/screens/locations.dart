import 'package:fav_location/providers/users_location.dart';
import 'package:fav_location/screens/addLoction.dart';
import 'package:fav_location/widgets/location_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Locations extends ConsumerStatefulWidget {
  const Locations({super.key});

  @override
  ConsumerState<Locations> createState() {
    return _LocationScreenState();
  }
}

class _LocationScreenState extends ConsumerState<Locations> {
  late Future<void> _placeFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _placeFuture = ref.read(userLocationProvider.notifier).loadPlaces();
    print(_placeFuture);
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: _placeFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : LocationList(
                      locations: userLocation,
                    ),
        ),
      ),
    );
  }
}
