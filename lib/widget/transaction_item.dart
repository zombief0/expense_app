import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required Transaction userTransaction,
    @required this.deleteTx,
  })  : _userTransaction = userTransaction,
        super(key: key);

  final Transaction _userTransaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${_userTransaction.amount}')),
          ),
        ),
        title: Text(
          _userTransaction.title,
        ),
        subtitle: Text(DateFormat.yMMMMd().format(_userTransaction.date)),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTx(_userTransaction.id),
        ),
      ),
    );
  }
}
