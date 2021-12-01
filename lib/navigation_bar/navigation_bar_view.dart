import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/constants.dart';
import 'package:site_demo/home/home_view.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: NavigationMobileView(),
        desktopView: NavigationDesktopView());
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 100,
      width: 1092,
      padding: kScreenPadding,
      child: Row(
        children: [
          Image.asset(
            'images/h.png',
            height: 44.0,
          ),
          Spacer(),
          for (var item in navigationItems)
            NavigationBarItem(
                onPressed: () {
                  scrollController.animateTo(item.position,
                      duration: Duration(milliseconds: 700),
                      curve: Curves.easeInOut);
                },
                data: item.text),
        ],
      ),
    );
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset(
            'images/h.png',
            height: 14.0,
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          )
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.onPressed,
    required this.data,
  }) : super(key: key);

  final void Function() onPressed;
  final String data;

  @override
  Widget build(BuildContext context) {
    final isSamll = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPressed,
        child: Text(data, style: TextStyle(fontSize: isSamll ? 17 : 24.0)),
      ),
    );
  }
}
