import 'package:flutter/material.dart';
import 'package:rss_app/vues/tile_view.dart';

import '../modeles/article.dart';
class ListeView extends StatelessWidget{
  final List<Article> articles;

  ListeView({required this.articles});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  ListView.separated(itemBuilder: (BuildContext context, int index) {

      return TileView(article: articles[index]);
    },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        }, itemCount: articles.length);
  }

}