import 'package:rss_app/modeles/article.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;

class Feed_parser{
  Future<List<Article>>getFeed(String urlString) async {
    List<Article> articles=[];
    // String urlString="https://www.geek-otaku-news.com/feed/";
    //String urlString="https://mcabenin2.bj/feed/news";

    final client=http.Client();
    final url=Uri.parse(urlString);
    final clientResponse=await client.get(url);

    final rssfeed=RssFeed.parse(clientResponse.body);
    final items=rssfeed.items;
    if (items!=null){


        items.forEach((element) {
           articles=items.map((e) => Article(item: e)).toList();

      });

    }
return articles;
  }
}