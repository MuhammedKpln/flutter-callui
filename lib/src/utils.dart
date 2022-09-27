import 'package:intl/intl.dart';

DateFormat _dateFormat = DateFormat(DateFormat.HOUR_MINUTE_SECOND, 'tr');

/// It takes a DateTime object and returns a String
///
/// Args:
///   date (DateTime): The date to format.
String formatDate(DateTime date) {
  return _dateFormat.format(date);
}
