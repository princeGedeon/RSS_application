import 'package:flutter/material.dart';

import 'modeles/article.dart';

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
      body:(isPortrait())?Column(children: children(),):Row(children: children(),) ,
    );
  }

  bool isPortrait(){
    return (MediaQuery.of(context).orientation==Orientation.portrait);
  }

  List<Widget> children(){
    return [
      (MediaQuery.of(context).orientation==Orientation.portrait)?
      (widget.article.image_url=='default')?

      Padding(padding:EdgeInsets.all(8) ,child:Image.asset("images/tumblr_9b818145206dc05c3553585d1d4952af_443ecc25_1280.jpg",
        fit:BoxFit.cover,
        height: MediaQuery.of(context).size.height/2),
      ): Padding(padding:EdgeInsets.all(8) ,child: Image.network(widget.article.image_url,
        fit:BoxFit.cover,
        height: MediaQuery.of(context).size.height/2,)
      )
          :
    (widget.article.image_url=='default')?Padding(padding: EdgeInsets.all(8),child:Image.asset("images/tumblr_9b818145206dc05c3553585d1d4952af_443ecc25_1280.jpg",
      fit:BoxFit.cover,
      height: MediaQuery.of(context).size.width/4,
    ) ,):Padding(padding:EdgeInsets.all(8) ,child:Image.network(widget.article.image_url,
      fit:BoxFit.cover,
      height: MediaQuery.of(context).size.width/4,
    ) ,),
      Expanded(child:
          Padding(
            padding: EdgeInsets.all(8),
      child:  Column(
    children: [
      Text((widget.article.autheur=="")?"Publié par Anonymous":"Publié par ${widget.article.autheur}"),
      Padding(padding: EdgeInsets.only(top: 15)),
      Expanded(

        child: Text(widget.article.desc),)
    ],
    )
      )
     
      )
      


    ];
  }

}