import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_apps/providers/user_places.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlace> {
  final _titleController = TextEditingController();

  void savePlace() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredText);
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
                maxLength: 10,
                decoration: InputDecoration(
                  label: Text('Title'),
                ),
                controller: _titleController,
              ),
              const SizedBox(
                height: 10,
              ),
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
