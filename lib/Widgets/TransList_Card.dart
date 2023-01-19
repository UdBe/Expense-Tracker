import 'dart:ui';
import 'package:intl/intl.dart';

import '../Models/Transaction.dart';
import 'package:flutter/material.dart';

class Translist extends StatelessWidget {
  List<Transaction> mylist = [];

  Translist(this.mylist);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: const EdgeInsets.only(top: 5),
      child: ListView(
          children: mylist.map((tx) {
        return Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Text(
                  tx.amount.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tx.name,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.dateTime),
                    style: const TextStyle(fontSize: 9, color: Colors.blueGrey),
                  )
                ],
              )
            ],
          ),
        );
      }).toList()),
    );
  }
}
