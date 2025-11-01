import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime{
  DateTime get dateOnly {
    return new DateTime(year, month, day);

  }
}

extension  intExtension on int {
  String get formattedDate {
DateTime date = DateTime.fromMicrosecondsSinceEpoch(this);
String formattedDateValue = DateFormat.d("dd\nmmm").format(date);
return formattedDateValue;
  }
}