import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:real_estate_application/models/HouseModel.dart';

class HomeProvider extends ChangeNotifier {
  List<HouseModel> _houses = [];
  int _selectedNavIndex = 0;
  int _selectedFilterIndex = 0;
  String _searchQuery = "";

  final List<String> filters = ["All", "Rental House", "Apartment", "Rooms", "Houses"];

  List<HouseModel> get houses => _houses;
  int get selectedNavIndex => _selectedNavIndex;
  int get selectedFilterIndex => _selectedFilterIndex;
  String get searchQuery => _searchQuery;

  HomeProvider() {
    loadHouses();
  }

  /// ✅ Houses filtered by category & search
  List<HouseModel> get filteredHouses {
    List<HouseModel> results = _houses;

    String selectedType = filters[_selectedFilterIndex];

    if (selectedType != "All") {
      results = results.where((h) => h.category == selectedType).toList();
    }

    if (_searchQuery.isNotEmpty) {
      results = results
          .where(
            (h) =>
                h.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                h.location.toLowerCase().contains(_searchQuery.toLowerCase()),
          )
          .toList();
    }

    return results;
  }

  /// Load data from JSON
  Future<void> loadHouses() async {
    try {
      final jsonString = await rootBundle.loadString("assets/json/house.json");
      final List<dynamic> jsonData = json.decode(jsonString);

      log("Loaded JSON count: ${jsonData.length}");

      _houses = jsonData
          .map((e) {
            try {
              return HouseModel.fromJson(e);
            } catch (err, st) {
              log("Error parsing house: $err");
              log("$st");
              return null;
            }
          })
          .whereType<HouseModel>()
          .toList();

      log("Parsed houses count: ${_houses.length}");
      log("Categories loaded: ${_houses.map((h) => h.category).toSet()}");

      notifyListeners();
    } catch (e, st) {
      log("Error loading houses.json: $e");
      log("$st");
    }
  }

  void setNavIndex(int index) {
    _selectedNavIndex = index;
    notifyListeners();
  }

  void setFilterIndex(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
    log("Selected Filter: ${filters[index]}");
    log("Available categories: ${_houses.map((h) => h.category).toSet()}");
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
