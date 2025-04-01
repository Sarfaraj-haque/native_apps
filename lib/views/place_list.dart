import 'package:flutter/material.dart';
import 'package:native_apps/model/place.dart';
import 'package:native_apps/views/places_details.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text('No Data Added'),
      );
    }
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PlacesDetails(place: places[index]),
                ),
              ),
              title: Text(places[index].title),
            ),
        itemCount: places.length);
  }
}
