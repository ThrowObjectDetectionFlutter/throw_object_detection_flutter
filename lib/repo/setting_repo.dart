import 'package:sp_util/sp_util.dart';

import 'env_repo.dart';

class SettingRepo {
  Future<void> savePythonPath(String path) async {
    await SpUtil.putString("python", path);
  }

  String? getPythonPath() {
    return SpUtil.getString("python", defValue: EnvRepo().getPythonPath());
  }
}
