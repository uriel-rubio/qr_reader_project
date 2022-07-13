import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedScreen = 0;
  int get selectedScreen {
    return _selectedScreen;
  }

  set selectedScreen(int i) {
    _selectedScreen = i;
    notifyListeners();
  }
}
