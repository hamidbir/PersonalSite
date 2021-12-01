import 'package:flutter/material.dart';
import 'package:site_demo/components/desktop_view_builder.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/components/mobile_view_builder.dart';
import 'package:site_demo/skills/outlined_Skills_view.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({
    Key? key,
  }) : super(key: key);
  static const title = 'Skills';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      desktopView: SkillsDesktopView(),
      mobileView: SkillsMobileView(),
      showMobile: width < 745,
    );
  }
}

class SkillsDesktopView extends StatelessWidget {
  const SkillsDesktopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: SkillsView.title,
      children: [
        SizedBox(
          height: 20,
        ),
        for (var rowIndex = 0; rowIndex < skills.length / 4; rowIndex++) ...[
          Row(
            children: [
              for (var index = 0; index < skills.length / 2; index++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: index != 0 ? 8.0 : 0),
                    child: OutlinedSkillContanier(
                        index: index, rowIndex: rowIndex),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
        ],
        SizedBox(height: 70),
      ],
    );
  }
}

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: SkillsView.title,
      children: [
        for (var index = 0; index < skills.length; index++) ...[
          OutlinedSkillContanier(
            index: index,
            isMobile: true,
          ),
          SizedBox(height: 10),
        ]
      ],
    );
  }
}

final skills = [
  'Flutter',
  'Firebase',
  'UI Design',
  'Firestore',
  'GetX',
  'BLoC',
];
