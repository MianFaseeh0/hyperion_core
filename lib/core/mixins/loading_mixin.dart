import 'package:flutter/material.dart';

mixin LoadingMixin on ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    _isLoading = value;
    notifyListeners();
  }
}
