import 'package:flutter/material.dart';


class NavigatorContainer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const NavigatorContainer({
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(141, 163, 173, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Image.asset(
              selectedIndex == 0 ? 'lib/assets/notepad_dark.png' : 'lib/assets/notepad.png',
              width: 32,
              height: 32,
            ),
            onPressed: () => onIndexChanged(0),
          ),
          IconButton(
            icon: Image.asset(
              selectedIndex == 1 ? 'lib/assets/star_dark.png' : 'lib/assets/star.png',
              width: 32,
              height: 32,
            ),
            onPressed: () => onIndexChanged(1),
          ),
          IconButton(
            icon: Image.asset(
              selectedIndex == 2 ? 'lib/assets/history_dark.png' : 'lib/assets/history.png',
              width: 32,
              height: 32,
            ),
            onPressed: () => onIndexChanged(2),
          ),
        ],
      ),
    );
  }
}
