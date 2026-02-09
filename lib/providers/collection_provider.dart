import 'package:flutter/material.dart';
import '../models/collection_model.dart';
import '../services/api_service.dart';

class CollectionProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<ProductCollection> _collections = [];
  bool _isLoading = false;
  String? _error;
  int _expandedIndex = -1;

  List<ProductCollection> get collections => _collections;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get expandedIndex => _expandedIndex;

  Future<void> fetchCollections() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _collections = await _apiService.fetchCollections();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load collections. Please try again.';
      notifyListeners();
    }
  }

  void toggleExpanded(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = -1;
    } else {
      _expandedIndex = index;
    }
    notifyListeners();
  }
}
