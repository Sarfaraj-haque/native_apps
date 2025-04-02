import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_apps/providers/user_places.dart';
import 'package:native_apps/views/add_place.dart';
import 'package:native_apps/views/place_list.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userPlaces=ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => AddPlace()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlaceList(places: userPlaces),
      ),
    );
  }
}
