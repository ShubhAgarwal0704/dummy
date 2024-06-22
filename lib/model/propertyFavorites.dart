import 'package:flutter/material.dart';
import 'package:hotel_app/model/PropertyProvider.dart';
import 'package:hotel_app/model/propertyModel.dart';

class PropertyFavorites extends ChangeNotifier {
  List<PropertyModel> favorites = [];

  List<PropertyModel> getFavorites() => favorites;

  void addToFavories(PropertyModel property) {
    favorites.add(property);
    notifyListeners();
  }

  void removeFromFavories(PropertyModel property) {
    favorites.remove(property);
    notifyListeners();
  }

  bool hotelIsFavorite(PropertyModel property) {
    return favorites.contains(property);
  }
}
