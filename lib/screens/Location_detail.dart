import 'package:fav_location/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LocationDetail extends StatelessWidget {
  const LocationDetail({super.key, required this.location});
  final Place location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
      ),
      body: Center(
        child: Stack(children: [
          Image.file(
            location.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Text(
            location.title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ]),
      ),
    );
  }
}
