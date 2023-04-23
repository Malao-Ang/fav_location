import 'package:fav_location/providers/users_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AddLocation extends ConsumerStatefulWidget {
  const AddLocation({super.key});

  @override
  ConsumerState<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends ConsumerState<AddLocation> {
  final _titleController = TextEditingController();
  void _saveLocation() {
    final enterText = _titleController.text;
    if (enterText.isEmpty) {
      return;
    }
    ref.read(userLocationProvider.notifier).addPlace(enterText);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Location"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              Gap(16),
              ElevatedButton.icon(
                onPressed: _saveLocation,
                label: Text("Add Place"),
                icon: Icon(Icons.add),
              )
            ],
          ),
        ));
  }
}