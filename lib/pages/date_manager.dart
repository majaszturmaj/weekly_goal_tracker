import 'package:intl/intl.dart';
import 'variable_resource.dart';

class DateManager {
  static int weekNumber = 0;

  static int getWeekOfYear(DateTime date) {
    int daysPassed = date.difference(DateTime(date.year, 1, 1)).inDays;
    int weekOfYear = (daysPassed / 7).ceil();
    return weekOfYear;
  }

  static bool setWeekNumber(int week) {
    if (weekNumber != week) {
      weekNumber = week;
      VarContainer.addHistoryNote();
      return true;
    }
    return false;
  }

  static String getFormattedDate() {
    final formatter = DateFormat('dd MMMM');
    final now = DateTime.now();
    setWeekNumber(getWeekOfYear(now));
    return '${formatter.format(now)} - week $weekNumber of ${now.year}';
  }


}