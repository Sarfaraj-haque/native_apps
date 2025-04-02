import 'dart:io';

import 'package:uuid/uuid.dart';

class Place {
  Place(this.title, this.image) : id = Uuid().v4();
  final String id;
  final String title;
  final File image;
}
