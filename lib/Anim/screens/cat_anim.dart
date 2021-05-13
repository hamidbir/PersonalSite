import 'dart:math';

import 'package:flutter/material.dart';
import 'package:site_demo/Anim/widgets/cat.dart';

class CatAnimation extends StatefulWidget {
  final bool isMobile;

  const CatAnimation({Key key, this.isMobile}) : super(key: key);
  @override
  _CatAnimationState createState() => _CatAnimationState();
}

class _CatAnimationState extends State<CatAnimation>
    with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;
  @override
  void initState() {
    super.initState();
    boxController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    boxAnimation = Tween(begin: pi * 0.60, end: pi * 0.65).animate(
        CurvedAnimation(parent: boxController, curve: Curves.easeInOut));
    boxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        boxController.forward();
      }
    });
    boxController.forward();
    catController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    catAnimation = Tween(
            begin: widget.isMobile ? -10.0 : -20.0,
            end: widget.isMobile ? -22.0 : -42.0)
        .animate(CurvedAnimation(parent: catController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (catAnimation.status == AnimationStatus.completed) {
            boxController.forward();
            catController.reverse();
          } else if (catAnimation.status == AnimationStatus.dismissed) {
            boxController.stop();
            catController.forward();
          }
        },
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              BuildAnimation(
                catAnimation: catAnimation,
              ),
              BuildBox(),
              BuildLeftFlap(
                  boxAnimation: boxAnimation, isMobile: widget.isMobile),
              BuildRightFlap(
                  boxAnimation: boxAnimation, isMobile: widget.isMobile),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildLeftFlap extends StatelessWidget {
  const BuildLeftFlap({
    Key key,
    @required this.boxAnimation,
    this.isMobile = false,
  }) : super(key: key);

  final Animation<double> boxAnimation;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: boxAnimation.value,
            alignment: Alignment.topLeft,
            child: child,
          );
        },
        child: Container(
          height: 10.0,
          width: isMobile ? 45.0 : 75.0,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
          //child: Container(),
        ),
      ),
    );
  }
}

class BuildRightFlap extends StatelessWidget {
  const BuildRightFlap({
    Key key,
    @required this.boxAnimation,
    this.isMobile = false,
  }) : super(key: key);

  final Animation<double> boxAnimation;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: -boxAnimation.value,
            alignment: Alignment.topRight,
            child: child,
          );
        },
        child: Container(
          height: 10.0,
          width: isMobile ? 45.0 : 75.0,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        ),
      ),
    );
  }
}

class BuildBox extends StatelessWidget {
  const BuildBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          color: Colors.white),
    );
  }
}

class BuildAnimation extends StatelessWidget {
  const BuildAnimation({
    Key key,
    @required this.catAnimation,
  }) : super(key: key);

  final Animation<double> catAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: (context, child) {
          return Positioned(
            top: catAnimation.value,
            child: child,
            right: 0.0,
            left: 0.0,
          );
        },
        animation: catAnimation,
        child: Cat());
  }
}
