import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:site_demo/drawer/drawer_view.dart';
import 'package:site_demo/experience/experience_view.dart';
import 'package:site_demo/footer/footer_view.dart';
import 'package:site_demo/home/back_to_top_button.dart';
import 'package:site_demo/navigation_bar/navigation_bar_view.dart';
import 'package:site_demo/project/project_view.dart';
import 'package:site_demo/skills/skills_view.dart';
import 'package:site_demo/header/header_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0);

  List<NavigationItem> navigationItems = [];
  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem('projects', key: projectKey),
        NavigationItem('skills', key: skillsKey),
        NavigationItem('Experience', key: experienceKey),
        //NavigationItem('Blog',key: ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(
          update: (_, __) {
            return navigationItems;
          },
        ),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return scrollController;
        })
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                NavigationBarView(),
                HeaderView(),
                ProjectView(key: projectKey),
                SkillsView(key: skillsKey),
                ExperienceView(key: experienceKey),
                //BlogView(),
                FooterView()
              ],
            ),
          ),
        ),
        floatingActionButton: BackToTop(),
      ),
    );
  }
}

_getPosition(GlobalKey key) {
  final RenderBox rb = key.currentContext.findRenderObject();
  final position = rb.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}

class NavigationItem {
  final String text;
  final Icon icon;
  final GlobalKey key;

  NavigationItem(this.text, {this.icon, @required this.key});
  double get position => _getPosition(key);
}

final navigationItemText = [''];
final navigationItemIcon = [Icon(Icons.ac_unit)];
