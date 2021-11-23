import 'package:flutter/material.dart';

class TabStat extends StatefulWidget {
  const TabStat({Key key}) : super(key: key);

  @override
  _TabStatState createState() => _TabStatState();
}

class _TabStatState extends State<TabStat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.amber[800],
          width: 1,
        ),
      ),
    );
  }
}
