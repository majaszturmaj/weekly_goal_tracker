import 'package:intl/intl.dart';

class DateManager {
  static int weekNumber = 0;

  static int getWeekOfYear(DateTime date) {
    int daysPassed = date.difference(DateTime(date.year, 1, 1)).inDays;
    int weekOfYear = (daysPassed / 7).ceil();
    return weekOfYear;
  }

  static String getFormattedDate() {
    final formatter = DateFormat('dd MMMM');
    final now = DateTime.now();
    weekNumber = getWeekOfYear(now);
    return '${formatter.format(now)} - week $weekNumber of ${now.year}';
  }
}