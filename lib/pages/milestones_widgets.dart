import 'package:flutter/material.dart';
import 'package:flutter_project_layout/pages/variable_resource.dart';

import 'notepad_widgets.dart';


class MilestonesPage extends StatelessWidget {
  MilestonesPage({notepadText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0), // Add padding on left and right sides
            child: MilestonesNotepadTextContainer(),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0), // Add padding on left and right sides
            child: MilestonesTextFieldContainer(),
          ),
        ],
      ),
      ),
    );
  }
}

class MilestonesTextFieldContainer extends StatefulWidget {
  @override
  _MilestonesTextFieldContainerState createState() =>
      _MilestonesTextFieldContainerState();
}

class _MilestonesTextFieldContainerState
    extends State<MilestonesTextFieldContainer> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: VarContainer.milestonesText);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: const Color.fromRGBO(16, 43, 51, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: TextField(
            controller: _textEditingController,
            onChanged: (value) {
              setState(() {
                VarContainer.milestonesText = value;
              });
            },
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              color: Color.fromRGBO(226, 235, 237, 1),
              fontFamily: 'Inter',
              fontSize: 16,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
            decoration: const InputDecoration.collapsed(
              hintText: 'Set your lifegoals',
              hintStyle: TextStyle(
                color: Color.fromRGBO(226, 235, 237, 1),
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
    );
  }
}


class MilestonesNotepadTextContainer extends StatelessWidget {

  MilestonesNotepadTextContainer({unmodifiableText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
        color: Color.fromRGBO(249, 192, 111, 1),
      ),
      child: TextInputBox(
        onSaveAndClear: () {
          // Add your onSaveAndClear logic here
        },
        textEditingController: TextEditingController(),
      ),
    );
  }
}