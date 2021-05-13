import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:site_demo/Anim/screens/cat_anim.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/constants.dart';
import 'package:site_demo/header/header_body.dart';

String currentAnimation = "Defult";
bool isAnimating = false;

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: HeaderViewMobile(), desktopView: HeaderDesktopView());
  }
}

class HeaderDesktopView extends StatefulWidget {
  const HeaderDesktopView({
    Key key,
  }) : super(key: key);

  @override
  _HeaderDesktopViewState createState() => _HeaderDesktopViewState();
}

class _HeaderDesktopViewState extends State<HeaderDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: kInitWidth,
      height: kInitHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Expanded(
              child: HeaderBody(),
            ),
            Expanded(
              child: Stack(
                children: [
                  InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      _animateTo("Hello");
                    },
                    child: FlareActor(
                      'images/main7.flr',
                      animation: currentAnimation,
                      callback: (string) {
                        isAnimating = true;
                      },
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 65,
                      child: Container(
                          width: 100, height: 100, child: CatAnimation())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _animateTo(String anim) {
    if (_canAnimateTo(anim)) {
      isAnimating = true;
      setState(() {
        currentAnimation = anim;
        Future.delayed(const Duration(seconds: 9), () {
          setState(() {
            currentAnimation = "Defult";
          });
        });
      });
    }
  }

  bool _canAnimateTo(String anim) {
    if (currentAnimation == "Defult") {
      return anim == "Hello";
    }
    return (!isAnimating && currentAnimation != anim);
  }
}

class HeaderViewMobile extends StatefulWidget {
  const HeaderViewMobile({
    Key key,
  }) : super(key: key);

  @override
  _HeaderViewMobileState createState() => _HeaderViewMobileState();
}

class _HeaderViewMobileState extends State<HeaderViewMobile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    _animateTo("Hello");
                  },
                  child: FlareActor(
                    'images/main7.flr',
                    animation: currentAnimation,
                    callback: (string) {
                      isAnimating = true;
                    },
                  ),
                ),
                Positioned(
                    right: 45,
                    bottom: 0,
                    child: Container(
                        width: 50,
                        height: 50,
                        child: CatAnimation(isMobile: true))),
              ],
            ),
          ),
          HeaderBody(
            isMobile: true,
          ),
        ],
      ),
    );
  }

  void _animateTo(String anim) {
    if (_canAnimateTo(anim)) {
      isAnimating = true;
      setState(() {
        currentAnimation = anim;
        Future.delayed(const Duration(seconds: 9), () {
          setState(() {
            currentAnimation = "Defult";
          });
        });
      });
    }
  }

  bool _canAnimateTo(String anim) {
    if (currentAnimation == "Defult") {
      return anim == "Hello";
    }
    return (!isAnimating && currentAnimation != anim);
  }
}
