import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_object_detection_flutter/ui/main_model.dart';
import 'package:throw_object_detection_flutter/ui/trained/trained_model.dart';

class TrainedPageWrapper extends StatelessWidget {
  const TrainedPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TrainedModel()),
        ChangeNotifierProvider(create: (_) => MainModel()),
      ],
      child: const _TrainedPage(),
    );
  }
}

class _TrainedPage extends StatelessWidget {
  const _TrainedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
