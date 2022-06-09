import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rss_app/detailpage.dart';
import 'package:rss_app/controllers/feed_controller.dart';
import 'package:rss_app/modeles/feed_parser.dart';
import 'package:webfeed/domain/rss_feed.dart';

import 'modeles/article.dart';
import 'package:intl/intl.dart';

class HomePage {


String  reformatText(String text){
  const HtmlEscape htmlEscape = HtmlEscape();

  return htmlEscape.convert(text);

}

String reformatDate(DateTime datetime){
    DateFormat dateformate=DateFormat.yMMMMEEEEd();
    String s=dateformate.format(datetime);
    return s;
}

}