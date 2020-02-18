import 'package:flutter/cupertino.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
    return Column(
      children: <Widget>[
        NewTransaction(
            addNewTransaction: this._addNewTransaction
        ),
        TransactionList(transactions: this.transactions)
      ],
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
}
