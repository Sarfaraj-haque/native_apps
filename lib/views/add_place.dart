import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_apps/providers/user_places.dart';
import 'package:native_apps/widget/location_input.dart';

import '../widget/image_taker.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();
  File? pickedImage;

  void savePlace() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredText, pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Place"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text('Title'),
                ),
                controller: _titleController,
              ),
              const SizedBox(
                height: 10,
              ),
              ImageTaker(
                onPickImage: (image) {
                  pickedImage = image;
                },
              ),
              const SizedBox(height: 10),
              LocationInput(),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: savePlace,
                label: Text('Add a Place'),
                icon: Icon(Icons.add),
              )
            ],
          ),
        ));
  }
}
