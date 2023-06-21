import 'package:shared_preferences/shared_preferences.dart';
import 'history_widgets.dart';

class VarContainer {
  static String _notepadTypedText = '';
  static String _milestonesText = '';
  static List<String> _historyNotes = [];
  static int _currentWeekNumber = 0;

  static const String _notepadTypedTextKey = 'notepadTypedText';
  static const String _milestonesTextKey = 'milestonesText';
  static const String _historyNotesKey = 'historyNotes';
  static const String _currentWeekNumberKey = 'currentWeekNumber';

  static Future<void> loadValues() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _notepadTypedText = prefs.getString(_notepadTypedTextKey) ?? '';
      _milestonesText = prefs.getString(_milestonesTextKey) ?? '';
      _historyNotes = prefs.getStringList(_historyNotesKey) ?? [];
      _currentWeekNumber = prefs.getInt(_currentWeekNumberKey) ?? 0;
    } catch (e) {
      // Handle the exception, e.g., logging or displaying an error message.
      print('Error loading values from shared preferences: $e');
    }
  }

  static Future<void> saveValues() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_notepadTypedTextKey, _notepadTypedText);
      await prefs.setString(_milestonesTextKey, _milestonesText);
      await prefs.setStringList(_historyNotesKey, _historyNotes);
      await prefs.setInt(_currentWeekNumberKey, _currentWeekNumber);
    } catch (e) {
      // Handle the exception, e.g., logging or displaying an error message.
      print('Error saving values to shared preferences: $e');
    }
  }

  static void addHistoryNote() {
    if (_notepadTypedText.isNotEmpty) {
      _historyNotes.insert(0, _notepadTypedText);
      HistoryPageState().addHistoryBoxes();
      saveValues();
    }
  }
  static void deleteHistoryNote(int index) {
    if (index >= 1 && index < _historyNotes.length) {
      _historyNotes.removeAt(index);
      saveValues();
    }
  }

  static String get notepadTypedText => _notepadTypedText;

  static set notepadTypedText(String value) {
    _notepadTypedText = value;
    saveValues();
  }

  static String get milestonesText => _milestonesText;

  static set milestonesText(String value) {
    _milestonesText = value;
    saveValues();
  }

  static List<String> get historyNotes => _historyNotes;

  static set historyNotes(List<String> value) {
    _historyNotes = value;
    saveValues();
  }

  static int get currentWeekNumber => _currentWeekNumber;

  static set currentWeekNumber(int value) {
    _currentWeekNumber = value;
    saveValues();
  }
}