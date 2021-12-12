import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_object_detection_flutter/ui/setting/setting_model.dart';

class SettingPageWrapper extends StatelessWidget {
  const SettingPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SettingModel(), child: const _SettingPage());
  }
}

class _SettingPage extends StatelessWidget {
  const _SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '设置',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text("Python 解释器路径",
              style: TextStyle(fontSize: 14, color: Color(0xFF333333))),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff797979), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.code),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Python",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF000000))),
                    const Text("指定 Python 解释器的路径，如未设置则使用环境变量中的 Python",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF858585))),
                    context.watch<SettingModel>().pythonPath != null
                        ? Text(context.read<SettingModel>().pythonPath!)
                        : const Text("未设置"),
                  ],
                ),
                const SizedBox(width: 32),
                OutlinedButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['exe'],
                    );
                    if (result != null) {
                      context.read<SettingModel>().pythonPath =
                          result.files.single.path;
                    }
                  },
                  child: const Text("选择文件"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
