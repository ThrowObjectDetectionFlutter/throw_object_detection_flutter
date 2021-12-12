import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_object_detection_flutter/data/constans.dart';
import 'package:throw_object_detection_flutter/ui/home/home_page.dart';
import 'package:throw_object_detection_flutter/ui/main_model.dart';
import 'package:throw_object_detection_flutter/ui/setting/setting_page.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainModel(), child: const _MainPage());
  }
}

class _MainPage extends StatelessWidget {
  const _MainPage({Key? key}) : super(key: key);

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
          selected:
              context.watch<MainModel>().currentIndex == Constant.page2Index,
          onTap: () {
            context.read<MainModel>().currentIndex = Constant.page2Index;
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

  Widget _buildContentPage(BuildContext context) {
    switch (context.watch<MainModel>().currentIndex) {
      case 0:
        return const HomePageWrapper();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return const SettingPageWrapper();
      default:
        return Container();
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
          SingleChildScrollView(child: _buildContentPage(context)),
        ],
      ),
      drawer: MediaQuery.of(context).size.width < 768
          ? Drawer(child: _buildMenuList(context))
          : null,
    );
  }
}
