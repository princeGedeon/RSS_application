import 'package:flutter/material.dart';
import 'package:rss_app/controllers/feed_controller.dart';

import '../modeles/article.dart';
import '../modeles/feed_parser.dart';
import '../modeles/rss_type.dart';

class HomeController extends StatelessWidget{
  List<RssType> types=[
    RssType(type: "Infos", url: "https://www.francebleu.fr/rss/alsace/rubrique/infos.xml"),
    RssType(type: "Sport", url: "https://www.francebleu.fr/rss/armorique/rubrique/sports.xml"),
    RssType(type: "Culture", url: "https://www.francebleu.fr/rss/armorique/rubrique/culture.xml")

  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: types.length,
        child:
        Scaffold(
          appBar: AppBar(title: const Text("Mon Flux RSS by Princeg"),
            bottom: TabBar(tabs: types.map((e) => Tab(text: e.type,)).toList(),),
          ),
          body: TabBarView(
            children: types.map((type) => FeedController(url: type.url)).toList(),
          ),
        )
    );

  }

  }
