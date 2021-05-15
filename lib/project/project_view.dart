import 'package:flutter/material.dart';
import 'package:site_demo/components/desktop_view_builder.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/components/mobile_view_builder.dart';
import 'package:site_demo/project/project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
      image: 'images/p1.png',
      title: 'Agriculture App',
      description:
          'This program will help you to introduce the types of plants, trees and how to score it',
      technologies: ['Flutter', 'Firebase']),
  ProjectItem(
      image: 'images/p2.png',
      title: 'Teach App',
      description:
          'The training program is about mental illness, trauma and treatment',
      technologies: ['Flutter']),
  ProjectItem(
      image: 'images/p3.png',
      title: 'Business App',
      description: 'This app is good and can save your money',
      technologies: ['Flutter', 'UI']),
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const title = 'Projects';
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProjectItemBody(item: item),
              )),
          ],
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(
          height: 40,
        ),
        for (final item in kProjectItems) ProjectItemBody(item: item),
      ],
    );
  }
}
