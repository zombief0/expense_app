import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widget/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function deleteTx;

  TransactionList(this._userTransaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return _userTransaction.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                const Text('No transactions added Yet'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  userTransaction: _userTransaction[index], deleteTx: deleteTx);
            },
            itemCount: _userTransaction.length,
          );
  }
}
