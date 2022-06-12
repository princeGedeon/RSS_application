import 'package:flutter/material.dart';
import 'package:rss_app/modeles/article.dart';
import 'package:rss_app/vues/descrition_text.dart';
import 'package:rss_app/vues/image_view.dart';
import 'package:rss_app/vues/title_view.dart';

import '../vues/my_padd.dart';

class DetailController extends StatelessWidget{
  final Article article;
  DetailController({required this.article});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padd(),
            TitleText(title: article.title),
            ImageView(imageUrl: article.image_url),
            Padd(),
            Divider(),

            DescText(desc: article.desc),
            Padd(),
            ElevatedButton(onPressed: (){

            }, child: const Text("Vers l'article complet"))
            
          ],
        ),
      ),
    );
  }
  
}