import 'package:flutter/material.dart';
import 'package:rss_app/modeles/article.dart';
import 'package:rss_app/modeles/feed_parser.dart';
import '../vues/list_view.dart';

class FeedController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: Feed_parser().getFeed(),
      builder: (context, snap) {

        return ListeView(articles: snap.data??[]);
      },
    );
  }


}