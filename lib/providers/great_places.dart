import 'dart:io';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:recursos_nativos/models/place.dart';
import 'package:recursos_nativos/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place getItemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
    );

    _items.add(newPlace);
    DbUtil.insert(
      'places',
      {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
    notifyListeners();
  }
}
