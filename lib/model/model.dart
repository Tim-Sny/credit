import 'dart:collection';
import 'package:credit/model/file.dart';
import 'package:flutter/material.dart';

// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'model.g.dart';

// @JsonSerializable()
class Payment with ChangeNotifier {
  int ID;
  double restPrevious;
  double sum;
  DateTime datePrevious;
  DateTime date;

  double _pay;
  double get pay => _pay;
  double _interest;
  double get interest => _interest;
  double _rest;
  double get rest => _rest;
  int _days;

  static final double _rate = 11;

  Payment({
    @required int ID,
    @required DateTime datePrevious,
    @required double restPrevious,
    @required DateTime date,
    @required double sum,
  }) {
    this.ID = ID;
    this.datePrevious = datePrevious;
    this.restPrevious = restPrevious;
    this.date = date;
    this.sum = sum;

    this._days = date.difference(datePrevious).inDays;
    this._interest = (restPrevious * _days * _rate / 365 / 100);
    this._pay = (sum - interest);
    this._rest = restPrevious - pay;
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
        ID: json['id'] as int,
        restPrevious: json['rest-previous'] as double,
        sum: json['rest-sum'] as double,
        datePrevious: json['date-previous'] as DateTime,
        date: json['date'] as DateTime);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': ID,
      'rest-previous': restPrevious,
      'rest-sum': sum,
      'date-previous': datePrevious,
      'date': date,
    };
  }
}

class Payments with ChangeNotifier {
  DateTime firstDate = DateTime.utc(2021, 6, 6);
  double firstRest = 284531.95;
  List<Payment> pays = [];

  PaymentsStorage storage = new PaymentsStorage();
  //static var dataJSONFile = File('data/payments.json');

  // factory Payments.fromJson(Map<String, dynamic> json) {
  //   return Payments(
  //     //firstDate: json['firstDate'] as DateTime,
  //     pays: (json['pays'] as List<dynamic>)
  //         .map((dynamic e) => Payment.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //   );
  // }

  Payments.fromJson(Map<String, dynamic> json) {
    pays = (json['pays'] as List<dynamic>)
        .map((dynamic e) => Payment.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pays': pays.map((e) => e.toJson()).toList(),
    };
  }

  //Payments({List<Payment> pays}) {
  Payments() {
    //pays = [];
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: firstDate,
        date: DateTime.utc(2021, 6, 11),
        restPrevious: firstRest,
        sum: 10000,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 7, 9),
        sum: 10000,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 8, 13),
        sum: 15000,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 9, 1),
        sum: 5000,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 9, 11),
        sum: 15000,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 10, 8),
        sum: 45500,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 10, 12),
        sum: 15000,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 10, 22),
        sum: 7100,
      ),
    );
    pays.add(
      new Payment(
        ID: pays.length + 1,
        datePrevious: this.pays[pays.length - 1].date,
        restPrevious: this.pays[pays.length - 1]._rest,
        date: DateTime.utc(2021, 11, 3),
        sum: 5000,
      ),
    );
    // var ddd = this.toJson().toString();
    // print(ddd);
    // var sss = jsonEncode(ddd);
    // print(sss);
    // storage.writePayments(ddd);
  }

  UnmodifiableListView<Payment> get items => UnmodifiableListView(pays);
}
