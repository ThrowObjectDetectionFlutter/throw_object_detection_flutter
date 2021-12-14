
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:sp_util/sp_util.dart';
import 'package:throw_object_detection_flutter/ui/main_page.dart';

Future<void> main() async {
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: OneContext().builder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainWrapper(),
    );
  }
}