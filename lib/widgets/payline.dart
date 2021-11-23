import 'package:credit/model/functions.dart';
import 'package:credit/model/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PayLine extends StatelessWidget {
  final DateTime date;
  final DateTime previous_date;
  final double payment;
  final double balance;
  final double interest;
  final double debt;

  var _dateFormat = DateFormat('yyyy.MM.dd');

  PayLine(
      {this.previous_date,
      this.date,
      this.balance,
      this.payment,
      this.interest,
      this.debt});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Payment>(context, listen: false);
    return new Container(
      height: 40,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.amber[800],
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            flex: 23,
            child: Container(
              //width: MediaQuery.of(context).size.width / 4 - 10,
              alignment: Alignment.centerLeft,
              child: new Text(
                _dateFormat.format(product.date),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 27,
            child: Container(
              //width: MediaQuery.of(context).size.width / 4 - 10,
              alignment: Alignment.centerRight,
              child: new Text(
                formatCurrencyString(product.sum, precision: 0),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 23,
            child: Container(
              //width: MediaQuery.of(context).size.width / 4 - 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: new Text(
                      formatCurrencyString(product.pay, precision: 2),
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Center(
                    child: new Text(
                      formatCurrencyString(product.interest, precision: 2),
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 27,
            child: Container(
              //width: MediaQuery.of(context).size.width / 4 - 10,
              alignment: Alignment.centerRight,
              child: new Text(
                formatCurrencyString(product.rest, precision: 0),
                //formatCurrencyString(_balance, precision: 0),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
