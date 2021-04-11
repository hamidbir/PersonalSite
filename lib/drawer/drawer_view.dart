import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/home/home_view.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: DrawerMobileView(), desktopView: SizedBox());
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Hamid Raavnbod'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.blue,
                ],
                tileMode: TileMode.repeated,
              ),
            ),
          ),
          for (var item in navigationItems)
            ListTile(
              title: Text(item.text),
              onTap: () {
                scrollController.animateTo(item.position,
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOut);
                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}
