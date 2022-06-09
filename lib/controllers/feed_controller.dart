import 'package:flutter/material.dart';
import 'package:rss_app/modeles/article.dart';
import 'package:rss_app/modeles/feed_parser.dart';

import '../detailpage.dart';

class FeedController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: Feed_parser().getFeed(),
      builder: (context, snap) {
        final articles = snap.data ?? [];
        return
          ListView.separated(itemBuilder: (BuildContext context, int index) {
            final article = articles[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return DetailPage(article: article);
                    }));
              },
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Text(article.pubdate.toString(), style: TextStyle(
                          color: Colors.redAccent,
                          fontStyle: FontStyle.italic,
                          fontSize: 10,
                        ),)
                      ],

                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 8),
                      child: (article.image_url == 'default') ? Image.asset(
                        "images/tumblr_9b818145206dc05c3553585d1d4952af_443ecc25_1280.jpg",
                        fit: BoxFit.cover,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 4,
                      ) : Image.network(article.image_url,
                        fit: BoxFit.cover,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 4,
                      ),


                    ),
                    Text(article.title, style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ), textAlign: TextAlign.center,),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(article.desc, style: TextStyle(
                      color: Colors.black45,

                    ),)
                  ],
                ),
              ),
            );
          },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              }, itemCount: articles.length);
      },
    );
  }


}