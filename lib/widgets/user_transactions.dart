import 'package:flutter/cupertino.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatelessWidget {
  final List<Transaction> transactions;

  UserTransaction({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions: this.transactions)
      ],
    );
  }
}
