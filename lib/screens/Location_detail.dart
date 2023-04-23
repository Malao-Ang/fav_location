import 'package:fav_location/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LocationDetail extends StatelessWidget {
  const LocationDetail({super.key, required this.location});
  final Location location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
      ),
      body: Center(
        child: Text(
          location.title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
