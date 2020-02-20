import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '\$ ${this.transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark),
                      ),
                      margin: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColorLight, width: 1)),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.transactions[index].title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          DateFormat('yMMMMd').format(this.transactions[index].createdAt),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ));
          },
          itemCount: this.transactions.length,
      ),
    );
  }
}
