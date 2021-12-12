import 'dart:io';

class EnvRepo {
  String? getPythonPath() {
    String? result;
    var env = Platform.environment;
    if (Platform.isWindows) {
      env.forEach((k, v) {
        if (v.contains("python")) {
          if (k == "PATH") {
            var pathList = v.split(";");
            for (var element in pathList) {
              if (element.contains("python")) {
                result = element + "\\";
              }
            }
          } else {
            result = v + "\\";
          }
        }
      });
    }
    return result;
  }
}
