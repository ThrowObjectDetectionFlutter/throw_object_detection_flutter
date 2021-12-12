
import 'package:flutter/material.dart';

class MainModel with ChangeNotifier{
  /// 当前首页标签 Index
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }
}