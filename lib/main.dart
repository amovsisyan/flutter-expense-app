import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: '123',
        title: 'Transaction 1',
        amount: 123.23,
        createdAt: DateTime.now()),
    Transaction(
        id: '124',
        title: 'Transaction 2',
        amount: 44.23,
        createdAt: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              child: Text('Chart'),
              width: double.infinity,
              color: Colors.blue,
            ),
            elevation: 20,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(child: Row(
                children: <Widget>[
                  Container(
                    child: Text(tx.amount.toString()),
                  ),
                  Column(
                    children: <Widget>[
                      Text(tx.title),
                      Text(tx.createdAt.toIso8601String()),
                    ],
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
