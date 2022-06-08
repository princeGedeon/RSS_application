import 'package:webfeed/domain/rss_item.dart';

class Article{
  String? _title;
  String? _desc;
  DateTime? _pubdate;
  String? _image_url;
  String? _urllink;

  String get title=>_title??"";
  String get desc=>_desc??"";
  DateTime get pubdate =>_pubdate??DateTime.now();
  String get image_url=>_image_url??"default";
  String get urllink=>_urllink??"";

  Article({required RssItem item}){
    _title=item.title;
    _desc=item.description;
    _pubdate=item.pubDate;
    _image_url=item.enclosure?.url;
    _urllink=item.link;

  }
}