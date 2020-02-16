import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        amount: 23.23,
        createdAt: DateTime.now()),
    Transaction(
        id: '124',
        title: 'Transaction 2',
        amount: 44.23,
        createdAt: DateTime.now())
  ];
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Card(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    cursorColor: Colors.red,
                    decoration: InputDecoration(labelText: 'Title'),
                    onChanged: (value) {
                      this.titleInput = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    onChanged: (value) {
                      this.amountInput = value;
                    },
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    onPressed: () {
                      print(this.titleInput);
                      print(this.amountInput);
                    },
                    textColor: Colors.purple,
                    color: Colors.lightBlueAccent,
                  )
                ],
              ),
              padding: EdgeInsets.all(10),
            ),
          ),
          Column(
            children: transactions.map((tx) {
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
          )
        ],
      ),
    );
  }
}
