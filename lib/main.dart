import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import './models/transaction.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal app',
      theme: ThemeData(primarySwatch: Colors.purple, accentColor: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

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
            child: Chart(recentTransactions: _recentTransactions),
            elevation: 20,
          ),
          transactions.isEmpty
              ? Column(
                  children: <Widget>[
                    Text('No transactions'),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 200,
                      child: Image.asset('assets/imgs/no_data.png',
                          fit: BoxFit.cover),
                    )
                  ],
                )
              : UserTransaction(transactions: this.transactions)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.startAddNewTransaction(context),
      ),
    );
  }

  List<Transaction> get _recentTransactions {
    DateTime afterWhen = DateTime.now().subtract(Duration(days: 7));
    return this.transactions.where((Transaction transaction) {
      return transaction.createdAt.isAfter(afterWhen);
    }).toList();
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
