import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rss_app/detailpage.dart';
import 'package:webfeed/domain/rss_feed.dart';

import 'article.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget{
  String title;

  HomePage({required this.title});
  HomePageState createState()=>HomePageState();
}

class HomePageState extends State<HomePage>{
  List<Article> articles=[];

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ListView.separated(itemBuilder: (BuildContext context,int index){
        final article=articles[index];
        return InkWell(
          onTap: (){
            
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
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
                    Text(reformatDate(article.pubdate),style: TextStyle(
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 10,
                    ),)
                  ],
                  
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8),
                child:(article.image_url=='default')?Image.asset("images/tumblr_9b818145206dc05c3553585d1d4952af_443ecc25_1280.jpg",
                  fit:BoxFit.cover,
                  height: MediaQuery.of(context).size.height/4,
                ):Image.network(article.image_url,
                  fit:BoxFit.cover,
                  height: MediaQuery.of(context).size.height/4,
                ),


                  ),
                Text(article.title,style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(reformatText(article.desc),style: TextStyle(
                  color: Colors.black45,

                ),)
              ],
            ),
          ),
        );
      },
          separatorBuilder: (BuildContext context,int index){
        return const Divider();

          }, itemCount: articles.length)
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: getFeed,
        child: Icon(Icons.add),
        tooltip: "Récupérer",

      ),
    );
  }
 getFeed() async {

    String urlString="https://www.geek-otaku-news.com/feed/";
   //String urlString="https://mcabenin2.bj/feed/news";
    final client=http.Client();
    final url=Uri.parse(urlString);
    final clientResponse=await client.get(url);

    final rssfeed=RssFeed.parse(clientResponse.body);
    final items=rssfeed.items;
    if (items!=null){
      setState((){

        items.forEach((element) {
          articles=items.map((e) => Article(item: e)).toList();
        });

      });

    }

}

String  reformatText(String text){
  const HtmlEscape htmlEscape = HtmlEscape();
  print(htmlEscape.convert(text));
  return htmlEscape.convert(text);

}

String reformatDate(DateTime datetime){
    DateFormat dateformate=DateFormat.yMMMMEEEEd();
    String s=dateformate.format(datetime);
    return s;
}
}