import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_layout/pages/history_widgets.dart';
import 'package:flutter_project_layout/pages/milestones_widgets.dart';
import 'package:flutter_project_layout/pages/navigator_widget.dart';
import 'package:flutter_project_layout/pages/notepad_widgets.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Weekly Goal Tracker',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF41616F),
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
        home: MyHomePage(),
      );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = NotepadPage();
        break;
      case 1:
        page = MilestonesPage();
        break;
      case 2:
        page = HistoryPage();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: page,
          ),
          NavigatorContainer(
            selectedIndex: selectedIndex,
            onIndexChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}