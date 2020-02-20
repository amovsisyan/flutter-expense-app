import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function onSubmitHandler;

  NewTransaction(
      {@required this.onSubmitHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String titleInput;
  String amountInput;

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
              onSubmitted: (_) => this.onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                this.amountInput = value;
              },
              onSubmitted: (_) => this.onSubmit(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: this.onSubmit,
              textColor: Colors.purple,
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }

  onSubmit() {
    if (this.titleInput.length > 0 &&
        this.amountInput.length > 0 &&
        double.parse(this.amountInput) > 0) {
      widget.onSubmitHandler(this.titleInput, double.parse(this.amountInput));
    }
  }
}
