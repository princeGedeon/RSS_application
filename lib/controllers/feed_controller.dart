import 'package:flutter/material.dart';
import 'package:rss_app/modeles/article.dart';
import 'package:rss_app/modeles/feed_parser.dart';
import '../vues/list_view.dart';

class FeedController extends StatelessWidget {
  final String url;

  FeedController({required this.url});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: Feed_parser().getFeed(url),
      builder: (context, snap) {

        return ListeView(articles: snap.data??[]);
      },
    );
  }


}