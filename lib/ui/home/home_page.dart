import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_object_detection_flutter/generated/assets.dart';
import 'package:throw_object_detection_flutter/ui/home/home_model.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeModel(), child: const _HomePage());
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              '欢迎使用',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 23,
            ),
            const Text(
              '高空抛物检测系统',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 23,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('开始使用'))
          ],
        ),
        Image.asset(
          Assets.image1,
          width: 516,
          height: 475,
        )
      ],
    );
  }
}
