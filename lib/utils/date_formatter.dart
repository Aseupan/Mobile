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

String formatDateToString(String dateStr) {
  dateStr = dateStr.trim();
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateTime date = dateFormat.parse(dateStr);
  final monthNames = <String>[
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  String monthName = monthNames[date.month];
  String day = date.day.toString();
  String suffix = '';
  if (day.endsWith('1') && day != '11') {
    suffix = 'st';
  } else if (day.endsWith('2') && day != '12') {
    suffix = 'nd';
  } else if (day.endsWith('3') && day != '13') {
    suffix = 'rd';
  } else {
    suffix = 'th';
  }
  return '$monthName $day$suffix ${date.year}';
}
