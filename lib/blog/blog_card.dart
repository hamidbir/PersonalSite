import 'package:flutter/material.dart';
import 'package:site_demo/experience/experience_contanier.dart';
import 'package:webfeed/domain/rss_item.dart';

class BlogCard extends StatelessWidget {
  final bool? isMobile;
  final RssItem? article;
  const BlogCard({
    Key? key,
    this.isMobile,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.redAccent,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: 8, vertical: isMobile ?? false ? 20 : 40),
              child: Text(
                article!.title!,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article!.pubDate.toString(),
                    style: textStyle(isGrey: true),
                  ),
                  Text(
                    article!.content!.value,
                    maxLines: 3,
                    style: textStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
