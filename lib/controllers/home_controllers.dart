import 'package:flutter/material.dart';
import 'package:rss_app/controllers/feed_controller.dart';

import '../modeles/article.dart';
import '../modeles/feed_parser.dart';

class HomeController extends StatelessWidget{
  List<Article> articles=[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Mon Flux RSS by Princeg"),),
      body: FeedController(),
    );
  }

  }
