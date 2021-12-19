import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_object_detection_flutter/ui/main_model.dart';

import '../../generated/assets.dart';
import 'label_model.dart';

class LabelPageWrapper extends StatelessWidget {
  const LabelPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<LabelModel>(create: (_) => LabelModel()),
      ChangeNotifierProvider<MainModel>(create: (_) => MainModel()),
    ], child: const _LabelPage());
  }
}

class _LabelPage extends StatelessWidget {
  const _LabelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.watch<LabelModel>().title,
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                context.watch<LabelModel>().content,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 23,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('打开 LabelImage'))
            ],
          ),
        ),
        const SizedBox(
          width: 36,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              context.watch<LabelModel>().image,
              width: 516,
              height: 475,
            ),
          ),
        )
      ],
    );
  }
}
