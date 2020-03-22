
import 'package:intl/intl.dart';

String formatDate(String date) {

var oldFormat = DateFormat("dd MMM, yyyy").format(DateTime.parse(date.replaceAll("/", "")));

 return oldFormat;
//  DateTime myDate =DateTime.parse(date);
//  return new DateFormat("MMMM d").format(myDate);
}

int formatDateToMillisecond(String date) {

 var oldFormat = DateFormat("dd MMM, yyyy").format(DateTime.parse(date.replaceAll("/", "")));

 return DateTime.parse(date.replaceAll("/", "")).millisecondsSinceEpoch;
//  DateTime myDate =DateTime.parse(date);
//  return new DateFormat("MMMM d").format(myDate);
}