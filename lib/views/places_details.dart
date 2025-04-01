import 'package:flutter/material.dart';

import '../model/place.dart';

class PlacesDetails extends StatelessWidget {
  const PlacesDetails({super.key,required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Center(
        child: Text("No Data Found"),
      ),
    );
  }
}
