import 'package:intl/intl.dart';

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String formattedDate =
      DateFormat('MMMM d' '\'${_getDaySuffix(date.day)}\' y').format(date);
  return formattedDate;
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }
  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
