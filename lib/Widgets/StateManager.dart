import 'package:expense_tracker/Models/Transaction.dart';
import 'package:flutter/material.dart';

import 'TransList_Card.dart';
import 'UserInput.dart';

class StateManager extends StatefulWidget {
  const StateManager({super.key});

  @override
  State<StateManager> createState() => _StateManagerState();
}

class _StateManagerState extends State<StateManager> {
  List<Transaction> mylist = [
    Transaction('Course', 499, DateTime.now()),
    Transaction('Charger', 2799, DateTime.now())
  ];

  void addTransaction(String title, int amount) {
    final tx = new Transaction(title, amount, DateTime.now());
    setState(() {
      mylist.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [UserInputCard(addTransaction), Translist(mylist)],
        ),
      ),
    );
  }
}
