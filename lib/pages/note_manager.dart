import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'notepad_widgets.dart';
import 'milestones_widgets.dart';
import 'navigator_widget.dart';
import 'variable_resource.dart';
import 'history_widgets.dart';
import 'package:flutter/services.dart';
import 'notepad_widgets.dart';

class NoteManager {
  static int getCurrentWeekNumber() {
    final now = DateTime.now();
    final weekNumber = (now.difference(DateTime(now.year, 1, 1)).inDays / 7).ceil();
    return weekNumber;
  }

  static void saveNoteToHistory(String note, List<String> historyNotes) {
    historyNotes.add(note);
  }
}