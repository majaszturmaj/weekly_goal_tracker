import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_manager.dart';
import 'variable_resource.dart';

class NotepadPage extends StatefulWidget {
  @override
  _NotepadPageState createState() => _NotepadPageState();
}

class _NotepadPageState extends State<NotepadPage> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void saveAndClearNote() {
    final note = _textEditingController.text;

    if (note.isNotEmpty) {
      // Save note logic here
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            DateDisplay(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 100.0),
                  child: TextInputBox(
                    textEditingController: _textEditingController,
                    onSaveAndClear: saveAndClearNote,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class TextInputBox extends StatefulWidget {
  final TextEditingController textEditingController;
  final VoidCallback onSaveAndClear;

  TextInputBox({
    required this.onSaveAndClear,
    required this.textEditingController,
  });

  @override
  _TextInputBoxState createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  @override
  void initState() {
    super.initState();
    widget.textEditingController.text = VarContainer.notepadTypedText;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 192, 111, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: TextField(
                    controller: widget.textEditingController,
                    onChanged: (value) {
                      setState(() {
                        VarContainer.notepadTypedText = value;
                      });
                    },
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      color: Color.fromRGBO(16, 43, 51, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Wymień to z czego jesteś dumny w tym tygodniu',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(16, 43, 51, 1),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DateDisplay extends StatefulWidget {
  @override
  _DateDisplayState createState() => _DateDisplayState();
}

class _DateDisplayState extends State<DateDisplay> {
  String dateString = '';

  @override
  void initState() {
    super.initState();
    dateString = DateManager.getFormattedDate();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            dateString,
            style: const TextStyle(
              color: Color.fromRGBO(226, 235, 237, 1),
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}