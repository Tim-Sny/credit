import 'package:credit/widgets/tabPayments.dart';
import 'package:credit/widgets/tabStat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:credit/model/model.dart';
import 'package:credit/widgets/payline.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> mainTab = [
    TabStat(),
    TabPayments(),
    Text('333'),
    // TabInfo(),
  ];

  @override
  Widget build(BuildContext context) {
    //final paymentData = Provider.of<Payments>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: mainTab,
      ),
      // body: mainTab[_selectedIndex],
      // body: Container(
      //   child: Center(
      //     child: ListView.builder(
      //       itemCount: paymentData.items.length,
      //       itemBuilder: (context, int index) => ChangeNotifierProvider.value(
      //         value: paymentData.items[index],
      //         child: PayLine(),
      //       ),
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Статистика',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Платежи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Инфо',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
