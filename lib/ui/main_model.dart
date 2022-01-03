import 'package:flutter/material.dart';

import '../data/constans.dart';
import '../data/event.dart';
import '../util/event_bus.dart';

class MainModel with ChangeNotifier {
  MainModel() {
    /// 普通点击按钮的处理
    eventBus.on<PageChangeEvent>().listen((event) {
      if (event.pageCount == Constant.labelPageIndex) {
        return;
      }
      if (event.isToNext) {
        currentIndex = event.pageCount + 1;
      } else {
        currentIndex = event.pageCount - 1;
      }
    });

    /// 强制更改
    eventBus.on<ChangeMainModel>().listen((event) {
      currentIndex = event.index;
    });
  }

  /// 当前首页标签 Index
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  Future<int> get currentIndexFuture => Future.value(_currentIndex);

  set currentIndex(int value) {
    if (_currentIndex < value) {
      _isToNextPage = true;
    } else {
      _isToNextPage = false;
    }
    _currentIndex = value;
    notifyListeners();
  }

  bool _isToNextPage = false;

  bool get isToNextPage => _isToNextPage;
}
