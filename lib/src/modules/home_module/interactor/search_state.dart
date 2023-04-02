import 'package:flutter/foundation.dart';
import 'package:havenfinder/src/realm/schemas.dart';
import 'package:realm/realm.dart';

class SearchState extends ChangeNotifier {
  List<Property> _searchResults = [];

  List<Property> get searchResults => _searchResults;

  bool get isNotEmpty => _searchResults.isNotEmpty;

  void search(String query, Realm realm) {
    final results = realm
        .all<Property>()
        .query('title CONTAINS[c] $query OR description CONTAINS[c] $query');
    _searchResults = results.toList();
    notifyListeners();
  }

  void clearSearchResults() {
    _searchResults = [];
    notifyListeners();
  }
}
