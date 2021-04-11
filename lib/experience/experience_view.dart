import 'package:flutter/material.dart';
import 'package:site_demo/components/desktop_view_builder.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/components/mobile_view_builder.dart';
import 'package:site_demo/experience/experience_contanier.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    Key key,
  }) : super(key: key);
  static const title = 'Experience';
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ExperienceMobileView(),
        desktopView: ExperienceDesktopView());
  }
}

class ExperienceDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(titleText: ExperienceView.title, children: [
      SizedBox(
        height: 20,
      ),
      for (var rowIndex = 0; rowIndex < experinceList.length / 2; rowIndex++)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var index = 0; index < experinceList.length / 2; index++)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExperinceContanier(
                        experince:
                            experinceList.elementAt(rowIndex * 2 + index),
                        index: (rowIndex * 2 + index),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      SizedBox(
        height: 100,
      ),
    ]);
  }
}

class ExperienceMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(titleText: ExperienceView.title, children: [
      Column(
        children: [
          for (final experience in experinceList)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ExperinceContanier(
                  experince: experience,
                  index: experinceList.indexOf(experience)),
            ),
        ],
      ),
    ]);
  }
}
