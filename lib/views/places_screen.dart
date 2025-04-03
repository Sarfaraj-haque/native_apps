import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_apps/providers/user_places.dart';
import 'package:native_apps/views/add_place.dart';
import 'package:native_apps/views/place_list.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({
    super.key,
  });

  @override
  ConsumerState<PlacesScreen> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlace();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlacesProvider);
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
          child: FutureBuilder(
            future: _placesFuture,
            builder: (context, snapShot) =>
                snapShot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : PlaceList(places: userPlaces),
          ),
        ));
  }
}
