import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/constants.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: FooterMobileView(), desktopView: FooterDesktopView());
  }
}

class FooterMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      padding: kScreenPadding,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final social in socials)
                IconButton(
                  icon: social.icon,
                  onPressed: () => launch(social.url),
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.red,
                ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '© Hamid Ravanbod $currentYear',
            style: TextStyle(color: Colors.redAccent),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            mouseCursor: MaterialStateMouseCursor.clickable,
            child: Text(
              'See the source code',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.redAccent),
            ),
            onTap: () => launch('https://github.com/hamidbir/PersonalSite'),
          ),
        ],
      ),
    );
  }
}

class FooterDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      width: kInitWidth,
      padding: kScreenPadding,
      height: 100,
      child: Row(
        children: [
          Text(
            '© Hamid Ravanbod $currentYear -- ',
            style: TextStyle(color: Colors.redAccent),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            mouseCursor: MaterialStateMouseCursor.clickable,
            child: Text(
              'See the source code',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.redAccent),
            ),
            onTap: () => launch('https://github.com/hamidbir/PersonalSite'),
          ),
          Spacer(),
          for (final social in socials)
            IconButton(
              icon: social.icon,
              onPressed: () => launch(social.url),
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: Colors.red,
            ),
          SizedBox(
            width: 60,
          )
        ],
      ),
    );
  }
}

class SocialsInfo {
  final Widget icon;
  final String url;
  SocialsInfo({
    @required this.icon,
    @required this.url,
  });
}

final socials = [
  SocialsInfo(
      icon: FaIcon(FontAwesomeIcons.telegram),
      url: 'https://t.me/hamidprv1999'),
  SocialsInfo(
      icon: FaIcon(FontAwesomeIcons.twitter),
      url: 'https://twitter.com/Hamid70859844'),
  SocialsInfo(
      icon: FaIcon(FontAwesomeIcons.linkedin),
      url: 'https://www.linkedin.com/in/hamid-r-b42708179/'),
];
