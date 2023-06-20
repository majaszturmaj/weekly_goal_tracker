import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_manager.dart';
import 'variable_resource.dart';


bool hasDateChanged = false;


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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                DateDisplay(),
                TextInputBox(
                  textEditingController: _textEditingController,
                  onSaveAndClear: saveAndClearNote,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextInputBox extends StatefulWidget {
  final TextEditingController textEditingController;
  final VoidCallback onSaveAndClear;

  TextInputBox({required this.onSaveAndClear, required this.textEditingController});

  @override
  _TextInputBoxState createState() => _TextInputBoxState();

}

class _TextInputBoxState extends State<TextInputBox> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _textEditingController.text = VarContainer.notepadTypedText;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.1,
      left: 16,
      right: 16,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 192, 111, 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: TextField(
                controller: _textEditingController,
                onChanged: (value) {
                  setState(() {
                    VarContainer.notepadTypedText = value;
                  });
                  widget.onSaveAndClear();
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
    );
  }
}

class DateDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dateString = DateManager.getFormattedDate();
    return Center(
      child: Column(
        children: [
          Text(
            dateString,
            style: TextStyle(
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