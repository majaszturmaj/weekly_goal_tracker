import 'package:flutter/material.dart';
import '../main.dart';
import 'variable_resource.dart';
import 'package:provider/provider.dart';
import 'notepad_widgets.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 275,
              height: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color.fromRGBO(141, 163, 173, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 275,
              height: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color.fromRGBO(18, 100, 82, 1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: 275,
              height: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color.fromRGBO(226, 235, 237, 1),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}