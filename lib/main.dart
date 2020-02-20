import 'package:expense_flutter_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: '123',
        title: 'Transaction 111',
        amount: 23.23,
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => this.startAddNewTransaction(context),
          )
        ],
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
          UserTransaction(transactions: this.transactions)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.startAddNewTransaction(context),
      ),
    );
  }

  startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(
              onSubmitHandler: (titleInput, amount) =>
                  this.onSubmit(titleInput, amount)),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _addNewTransaction(String title, double amount) {
    final Transaction newTx = Transaction(
      id: DateTime.now().toIso8601String(),
      title: title,
      amount: amount,
      createdAt: DateTime.now(),
    );

    this.setState(() {
      this.transactions.add(newTx);
    });
  }

  onSubmit(String titleInput, double amount) {
    this._addNewTransaction(titleInput, amount);


    Navigator.of(context).pop();
  }
}
