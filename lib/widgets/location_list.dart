import 'package:fav_location/models/location.dart';
import 'package:fav_location/screens/Location_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LocationList extends StatelessWidget {
  const LocationList({super.key, required this.locations});
  final List<Place> locations;
  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return Center(
        child: Text("No location yet.",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      );
    }
    return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                radius: 26,
                backgroundImage: FileImage(locations[index].image),
              ),
              title: Text(locations[index].title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) =>
                        LocationDetail(location: locations[index])));
              },
              subtitle: Text(locations[index].location.address,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ));
  }
}
