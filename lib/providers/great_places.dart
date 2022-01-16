import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toIso8601String(),
        title: title,
        location: PlaceLocation(latitude: 3, longitude: 4),
        image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
  }
}
