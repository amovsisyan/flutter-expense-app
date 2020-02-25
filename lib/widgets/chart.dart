import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({@required this.recentTransactions});

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: Chartbar(
              label: data['day'],
              spendAmount: data['amount'],
              spendPercentage: maxSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / maxSpending,
            ),
          );
        }).toList(),
      ),
    );
  }

  double get maxSpending {
    return this.groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract((Duration(days: index)));
      double totalSum = 0.0;

      for (int i = 0; i < this.recentTransactions.length; i++) {
        if (this.recentTransactions[i].createdAt.day == weekDay.day &&
            this.recentTransactions[i].createdAt.month == weekDay.month &&
            this.recentTransactions[i].createdAt.year == weekDay.year) {
          totalSum += this.recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }
}
