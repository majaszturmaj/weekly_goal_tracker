import 'package:intl/intl.dart';
import 'variable_resource.dart';

class DateManager {
  static int weekNumber = 0;

  static int weeksBetween(DateTime from, DateTime to) {
    from = DateTime.utc(from.year, from.month, from.day);
    to = DateTime.utc(to.year, to.month, to.day);
    return (to.difference(from).inDays / 7).ceil();
  }

  static int getWeekOfYear(DateTime date) {
    final now = DateTime.now();
    final firstJan = DateTime(now.year, 1, 1);
    final weekNumber = weeksBetween(firstJan, now);
    return weekNumber;
  }

  static bool setWeekNumber(int week) {
    if (weekNumber != week) {
      weekNumber = week;
      VarContainer.addHistoryNote();

      // Clear the notepadTypedText
      VarContainer.notepadTypedText = '';

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