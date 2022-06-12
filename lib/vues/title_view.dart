import 'package:flutter/material.dart';

class TitleText extends StatelessWidget{
  final title;

  TitleText({required this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title, style: TextStyle(
      color: Colors.blue,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ), textAlign: TextAlign.center,);
  }

}