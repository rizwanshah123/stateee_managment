import 'package:flutter/foundation.dart';

class CountState with ChangeNotifier {
  int _count = 0;

  int get() => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
