import 'dart:io';
import 'package:path_provider/path_provider.dart' as pathProvider;

class PaymentsStorage {
  Future<String> get _localPath async {
    final directory = await pathProvider.getApplicationSupportDirectory();
    print(directory.toString());
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path.toString());
    return File('$path/payments.json');
  }

  Future<int> readPayments() async {
    try {
      final file = await _localFile;
      // Read the file
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writePayments(String payments) async {
    final file = await _localFile;
    return file.writeAsString('$payments');
  }

  // void writePayments(String payments) {
  //   //Future<File> writePayments(String payments) async {
  //   print('---------------------- writePayments');
  //   .. final file = await _localFile;
  //   // final file = await File('/payments.json');
  //   //var file = File('payments.json');
  //   print('$payments');

  //   //file.writeAsStringSync('123654123');
  //   //file.writeAsStringSync('$payments');
  //   // Write the file
  //   //return file.writeAsString('$payments');
  // }
}

// class FlutterDemo extends StatefulWidget {
//   const FlutterDemo({Key key, @required this.storage}) : super(key: key);

//   final PaymentsStorage storage;

//   @override
//   _FlutterDemoState createState() => _FlutterDemoState();
// }

// class _FlutterDemoState extends State<FlutterDemo> {
//   int _counter = 0;

//   @override
//   void initState() {
//     super.initState();
//     widget.storage.readPayments().then((int value) {
//       setState(() {
//         _counter = value;
//       });
//     });
//   }

//   Future<File> _incrementCounter() {
//     setState(() {
//       _counter++;
//     });

//     // Write the variable as a string to the file.
//     return widget.storage.writePayments('Test');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reading and Writing Files'),
//       ),
//       body: Center(
//         child: Text(
//           'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
