import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();


  static String getDateTimeFromTimeStamp(int timestamp){
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final DateFormat formatter = DateFormat('MMM dd, yyyy - hh:mm:ss');
    return formatter.format(date);
  }
}