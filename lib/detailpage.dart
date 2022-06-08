import 'package:flutter/material.dart';

import 'article.dart';

class DetailPage extends StatefulWidget{
  Article article;
  DetailPage({required this.article});
  @override
  DetailPageState createState()=>DetailPageState();

}

class DetailPageState extends State<DetailPage>{

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
        title: Text(widget.article.title),
      ),
    );
  }


}