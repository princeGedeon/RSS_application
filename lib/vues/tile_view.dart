import 'package:flutter/material.dart';
import 'package:rss_app/controllers/detail_controller.dart';
import 'package:rss_app/modeles/article.dart';
import 'package:rss_app/vues/title_view.dart';

import '../detailpage.dart';
import 'date_row.dart';
import 'descrition_text.dart';
import 'image_view.dart';
class TileView extends StatelessWidget{
  final Article article;
  TileView({required this.article});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return DetailController(article: article);
            }));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            DateRow(date: article.pubdate)
            ,
            ImageView(imageUrl: article.image_url)
            ,
            TitleText(title: article.title,)
          ,
            Padding(padding: EdgeInsets.only(top: 10)),
            DescText(desc: article.desc,)
          ],
        ),
      ),
    );
  }



}