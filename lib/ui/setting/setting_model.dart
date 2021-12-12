
import 'package:flutter/material.dart';
import 'package:throw_object_detection_flutter/repo/setting_repo.dart';


class SettingModel with ChangeNotifier {
  String? _pythonPath = SettingRepo().getPythonPath() != null ? SettingRepo().getPythonPath()! + "python.exe" : null;
  String? get pythonPath => _pythonPath;
  set pythonPath(String? value) {
    _pythonPath = value;
    SettingRepo().savePythonPath(value!);
    notifyListeners();
  }
}
