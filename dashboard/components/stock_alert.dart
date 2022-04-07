
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'indicator.dart';

class StockAlert extends StatefulWidget {
  const StockAlert({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StockAlertState();
}

class StockAlertState extends State {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Stock Alerts' , style: kfif),
          ],
        ),
      ),
    );
  }
}