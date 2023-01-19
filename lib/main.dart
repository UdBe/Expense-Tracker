//OM

import 'package:expense_tracker/Widgets/TransList_Card.dart';
import 'package:expense_tracker/Widgets/UserInput.dart';
import 'package:flutter/material.dart';

import 'Models/Transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expense Manager',
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

//Scaffold

class _homeState extends State<home> {
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

  void startModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return Container(
            // height: 300,
            child: UserInputCard(addTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                startModal(context);
              },
              icon: const Icon(Icons.add))
        ],
        title: const Center(child: Text('Expense Manager')),
      ),
      body: Translist(mylist),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
