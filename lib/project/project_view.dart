import 'package:flutter/material.dart';
import 'package:site_demo/components/desktop_view_builder.dart';
import 'package:site_demo/components/mobile_desktop_view_builder.dart';
import 'package:site_demo/components/mobile_view_builder.dart';
import 'package:site_demo/project/project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final String link;
  final List<String> technologies;

  ProjectItem({
    required this.image,
    required this.title,
    required this.description,
    required this.link,
    required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
      image: 'images/p1.png',
      title: 'Milipede shoe store',
      description:
          'This site is designed with Flutter Framework version (2.5.1) and GetX architecture. In the construction of this store, the features of ​​Firebase (authentication, Firestore, Firestorage) has been used.',
      link: 'https://github.com/hamidbir/Shopping',
      technologies: ['Flutter', 'Firebase', 'GetX']),
  ProjectItem(
      image: 'images/p2.jpg',
      title: 'Nike web',
      description: 'This is a simple website design',
      link: 'https://github.com/hamidbir/Nike-web',
      technologies: ['Flutter-web', 'UI']),
  ProjectItem(
      image: 'images/p3.png',
      title: 'Sweet shop app',
      link: 'nolink',
      description:
          "This was my final bachelor's project, which includes various parts such as authentication, selection of sweets, different categories, and so on.",
      technologies: ['Flutter', 'UI']),
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key? key,
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
