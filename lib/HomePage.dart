import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  String title;

  HomePage({required this.title});
  HomePageState createState()=>HomePageState();
}

class HomePageState extends State<HomePage>{


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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Prince Gédéon Yager")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getFeed,
        child: Icon(Icons.add),
        tooltip: "Récupérer",

      ),
    );
  }
void getFeed() async{
    String urlString="https://www.francebleu.fr/rss/infos.xml";
    final client=http.Client();
    final url=Uri.parse(urlString);
    final clientResponse=await client.get(url);
    print(clientResponse.body);


}
}