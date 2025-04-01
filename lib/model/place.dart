import 'package:uuid/uuid.dart';

class Place {
  Place(this.title) : id = Uuid().v4();
  final String id;
  final String title;
}
