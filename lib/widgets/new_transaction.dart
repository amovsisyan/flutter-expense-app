import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  String titleInput;
  String amountInput;

  final Function addNewTransaction;

  NewTransaction({this.addNewTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                this.addNewTransaction(this.titleInput, double.parse(this.amountInput));
              },
              textColor: Colors.purple,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
