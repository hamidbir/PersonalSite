// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:site_demo/blog/blog_card.dart';
// import 'package:site_demo/components/desktop_view_builder.dart';
// import 'package:site_demo/components/mobile_desktop_view_builder.dart';
// import 'package:site_demo/components/mobile_view_builder.dart';
// import 'package:webfeed/webfeed.dart';

// class BlogView extends StatelessWidget {
//   const BlogView({
//     Key? key,
//   }) : super(key: key);
//   static const String title = 'Blog';
//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider<List<RssItem>?>(
//         create: (_) => getArticle(),
//         initialData: null,
//         child: MobileDesktopViewBuilder(
//             mobileView: BlogMobileView(), desktopView: BlogDesktopView()));
//   }
// }

// class BlogDesktopView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final articles = context.watch<List<RssItem>>();
//     if (articles == null) return CircularProgressIndicator();
//     return DesktopViewBuilder(titleText: BlogView.title, children: [
//       Row(
//         children: [
//           for (final article in articles)
//             Expanded(
//                 child: BlogCard(
//               article: article,
//             )),
//         ],
//       ),
//     ]);
//   }
// }

// class BlogMobileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final articles = context.watch<List<RssItem>>();
//     if (articles == null) return CircularProgressIndicator();
//     return MobileViewBuilder(titleText: BlogView.title, children: [
//       for (final article in articles)
//         BlogCard(
//           article: article,
//           isMobile: true,
//         ),
//     ]);
//   }
// }

// Future<List<RssItem>> getArticle() async {
//   final url =
//       'https://cors-anywhere.herokuapp.com/https://hamidravanbod.medium.com/feed';
//   final response = await http.get(Uri.parse(url));
//   final parseresponse = RssFeed.parse(response.body);
//   final haveFlutterTag = (RssItem article) {
//     return article.categories!.any((category) => category.value == 'Flutter');
//   };
//   final flutterArticleList =
//       parseresponse.items!.where(haveFlutterTag).take(2).toList();
//   return flutterArticleList;
// }
