// import 'dart:io';

import 'package:credit/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/model.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Payments>(
      create: (context) => Payments(),
      child: MaterialApp(
        title: 'Кредит',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(title: 'Выплата кредита'),
      ),
    );
  }
}

// class JSONPays {
//   void encode() {
//     final obj = payments.map((e) => e.toJson()).toList();
//   }

//   String jsonString;
//   void decode() {
//     final json = jsonDecode(jsonString) as List<dynamic>;
//     final payments = json
//         .map((dynamic e) => Payments.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }
// }
