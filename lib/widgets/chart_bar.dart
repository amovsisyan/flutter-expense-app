import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendPercentage;

  Chartbar({this.label, this.spendAmount, this.spendPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${this.spendAmount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 200, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: this.spendPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
