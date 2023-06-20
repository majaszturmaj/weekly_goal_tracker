import 'package:flutter/material.dart';
import '../main.dart';
import 'variable_resource.dart';
import 'package:provider/provider.dart';
import 'notepad_widgets.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  List<Widget> boxes = [
    Container(
      margin: EdgeInsets.only(bottom: 16),
      width: 275,
      height: 132,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Color.fromRGBO(249, 192, 111, 1),
      ),
      child: TextInputBox(
        onSaveAndClear: () {
          // Add your onSaveAndClear logic here
        },
        textEditingController: TextEditingController(),
      ),
    ),
  ];

  void addHistoryBox(String historyText) {
    setState(() {
      boxes.insert(
        0,
        Container(
          margin: EdgeInsets.only(bottom: 16),
          width: 275,
          height: 132,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.blue, // Customize the color of the added box
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                historyText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: boxes,
        ),
      ),
    );
  }
}