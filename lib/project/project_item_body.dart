import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:site_demo/project/project_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItemBody extends StatelessWidget {
  const ProjectItemBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 300,
            height: 200,
            child: Image.asset(
              item.image,
              fit: BoxFit.fill,
            )),
        SizedBox(
          height: 15,
        ),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 10,
        ),
        Text(item.description, style: TextStyle(fontSize: 17)),
        SizedBox(
          height: 10,
        ),
        item.link == 'nolink'
            ? SizedBox()
            : InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Text('Link',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  launch(item.link);
                }),
        Row(
          children: [
            for (final tech in item.technologies)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(label: Text(tech)),
              ),
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
