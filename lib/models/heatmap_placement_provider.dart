


import 'package:flutter/material.dart';

class HeatmapPlacementProvider extends ChangeNotifier {
  bool _placementAtBottom = false;

  // getter
  bool get placedBottom => _placementAtBottom;

  // setter
  set placedBottom(bool val) {
    _placementAtBottom = val;
    notifyListeners();
  }

  // toggle
  void togglePlacement() {
    placedBottom = !_placementAtBottom;
  }
}