import 'package:intl/intl.dart';
class DateParser{



  String reformatDate(DateTime datetime){
    DateFormat dateformate=DateFormat.yMMMMEEEEd();
    String s=dateformate.format(datetime);
    return s;
  }
}