import 'package:flutter/material.dart';
import 'package:throw_object_detection_flutter/generated/assets.dart';

import '../../data/constans.dart';
import '../../data/event.dart';
import '../../util/event_bus.dart';

class LabelModel extends ChangeNotifier {
  LabelModel() {
    eventBus.on<PageChangeEvent>().listen((event) {
      if (event.pageCount != Constant.labelPageIndex) {
        return;
      }

      /// 第一页点返回就回到主页去
      if (!event.isToNext && labelIndex == 0) {
        eventBus.fire(ChangeMainModel(Constant.homePageIndex));
        return;
      }

      /// 第四页就要跳转下一个页面了
      if (event.isToNext && labelIndex == 3) {
        eventBus.fire(ChangeMainModel(Constant.page3Index));
        labelIndex = 0;
        return;
      }

      /// 否则就处理 Label 页面的文本
      if (event.isToNext) {
        labelIndex++;
      } else {
        labelIndex--;
      }
    });
  }

  int _labelIndex = 0;

  int get labelIndex => _labelIndex;

  set labelIndex(int index) {
    _labelIndex = index;
    notifyListeners();
  }

  final List<String> _titleList = ["使用 LabelImage", "基础设置", "设置标签", "完成标注"];
  final List<String> _contentList = [
    "进行高空抛物照片标注",
    "更改图片和标签路径\n设置YOLO标签格式",
    "根据不同目标\n设置对应的标签",
    "完成一张图片的标注"
  ];
  final List<String> _imageList = [
    Assets.image2,
    Assets.image3,
    Assets.image4,
    Assets.image5,
  ];

  String get title => _titleList[_labelIndex];

  String get content => _contentList[_labelIndex];

  String get image => _imageList[_labelIndex];
}
