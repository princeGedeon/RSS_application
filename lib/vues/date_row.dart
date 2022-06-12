import 'package:flutter/material.dart';
import 'package:rss_app/modeles/date_parser.dart';
class DateRow extends StatelessWidget{
  final DateTime date;

  DateRow({required this.date});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Row(
      children: [
        Spacer(),
        Text(DateParser().reformatDate(date), style: TextStyle(
          color: Colors.redAccent,
          fontStyle: FontStyle.italic,
          fontSize: 10,
        ),)
      ],

    );
  }


}