import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.transactions.map((tx) {
        return Card(
            child: Row(
              children: <Widget>[
                Container(
                  child: Text(
                    '\$ ${tx.amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 1)),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tx.title,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      DateFormat('yMMMMd').format(tx.createdAt),
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                )
              ],
            ));
      }).toList(),
    );
  }
}
