import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';
import 'package:throw_object_detection_flutter/data/constans.dart';
import 'package:throw_object_detection_flutter/ui/home/home_page.dart';
import 'package:throw_object_detection_flutter/ui/label/label_page.dart';
import 'package:throw_object_detection_flutter/ui/main_model.dart';
import 'package:throw_object_detection_flutter/ui/setting/setting_page.dart';

import '../data/event.dart';
import '../util/event_bus.dart';
import 'anim/slide_transition.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MainModel()),
    ], child: _MainPage(context));
  }
}

class _MainPage extends StatelessWidget {
  const _MainPage(BuildContext context, {Key? key}) : super(key: key);

  Widget _buildMenuList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '功能',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('主页'),
          selected:
              context.watch<MainModel>().currentIndex == Constant.homePageIndex,
          onTap: () {
            context.read<MainModel>().currentIndex = Constant.homePageIndex;
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit_outlined),
          title: const Text('标注'),
          selected: context.watch<MainModel>().currentIndex ==
              Constant.labelPageIndex,
          onTap: () {
            context.read<MainModel>().currentIndex = Constant.labelPageIndex;
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('训练'),
          selected:
              context.watch<MainModel>().currentIndex == Constant.page3Index,
          onTap: () {
            context.read<MainModel>().currentIndex = Constant.page3Index;
          },
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('检测'),
          selected:
              context.watch<MainModel>().currentIndex == Constant.page4Index,
          onTap: () {
            context.read<MainModel>().currentIndex = Constant.page4Index;
          },
        ),
        const Spacer(),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('设置'),
          selected: context.watch<MainModel>().currentIndex ==
              Constant.settingPageIndex,
          onTap: () {
            context.read<MainModel>().currentIndex = Constant.settingPageIndex;
          },
        ),
      ],
    );
  }

  Widget _buildSetupButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton.icon(
              onPressed: () {
                if (context.read<MainModel>().currentIndex !=
                    Constant.homePageIndex) {
                  eventBus.fire(PageChangeEvent(
                      context.read<MainModel>().currentIndex, false));
                }
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: context.watch<MainModel>().currentIndex ==
                        Constant.homePageIndex
                    ? const Color(0xff777777)
                    : const Color(0xff333333),
              ),
              label: const Text('')),
          const SizedBox(width: 8),
          OutlinedButton.icon(
              onPressed: () {
                if (context.read<MainModel>().currentIndex != 999) {
                  eventBus.fire(PageChangeEvent(
                      context.read<MainModel>().currentIndex, true));
                }
              },
              icon: Transform.rotate(
                angle: math.pi,
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Color(0xff333333),
                ),
              ),
              label: const Text(''))
        ],
      ),
    );
  }

  Widget _buildContentPage(BuildContext context) {
    switch (context.watch<MainModel>().currentIndex) {
      case 0:
        return HomePageWrapper(key: ValueKey(Constant.homePageIndex));
      case 1:
        return LabelPageWrapper(key: ValueKey(Constant.labelPageIndex));
      case 2:
        return Container(key: ValueKey(Constant.page3Index));
      case 3:
        return Container(key: ValueKey(Constant.page4Index));
      case 4:
        return SettingPageWrapper(key: ValueKey(Constant.settingPageIndex));
      default:
        return Container(key: ValueKey(Constant.page4Index));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width > 768)
            SizedBox(width: 300, child: _buildMenuList(context))
          else
            Container(),
          const VerticalDivider(
            width: 2,
            thickness: 1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width -
                (MediaQuery.of(context).size.width > 768 ? 302 : 2),
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              SingleChildScrollView(
                  child: AnimatedSwitcher(
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SlideTransitionX(
                          child: child,
                          direction: context.read<MainModel>().isToNextPage
                              ? AxisDirection.up
                              : AxisDirection.down,
                          position: animation,
                        );
                      },
                      duration: const Duration(milliseconds: 350),
                      child: _buildContentPage(context))),
              const Positioned(
                child: Icon(Icons.home_outlined),
                left: 16,
                bottom: 16,
              ),
              Positioned(
                child: _buildSetupButton(context),
                right: 0,
                bottom: 0,
              )
            ]),
          ),
        ],
      ),
      drawer: MediaQuery.of(context).size.width < 768
          ? Drawer(child: _buildMenuList(context))
          : null,
    );
  }
}
