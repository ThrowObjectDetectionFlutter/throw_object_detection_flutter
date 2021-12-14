import 'dart:io';
import 'package:process_run/shell.dart';

class ShellRepo {
  Future<String> getShellOutput(String command,{void Function(Process process)? onProcess}) async {
    var shell = Shell();

    await shell.run(command,onProcess: (process) => onProcess);

    return "output";
  }
}
