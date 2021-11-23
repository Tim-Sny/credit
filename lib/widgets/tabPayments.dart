import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:credit/model/model.dart';
import 'package:credit/widgets/payline.dart';

class TabPayments extends StatefulWidget {
  const TabPayments({Key key}) : super(key: key);

  @override
  _TabPaymentsState createState() => _TabPaymentsState();
}

class _TabPaymentsState extends State<TabPayments> {
  @override
  Widget build(BuildContext context) {
    print(Payments);
    //var payments = Payments(pays: []);
    final paymentData = Provider.of<Payments>(context);
    //print(paymentData.items.length);
    return Container(
      child: Center(
        child: ListView.builder(
          itemCount: paymentData.items.length,
          itemBuilder: (context, int index) => ChangeNotifierProvider.value(
            value: paymentData.items[index],
            child: PayLine(),
          ),
        ),
      ),
    );
  }
}
