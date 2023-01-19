import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final namecontroller = TextEditingController();
final amountcontroller = TextEditingController();

class UserInputCard extends StatelessWidget {
  final Function addtx;

  UserInputCard(this.addtx);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        TextField(
          controller: namecontroller,
          decoration: InputDecoration(labelText: "Transaction Name"),
        ),
        TextField(
          controller: amountcontroller,
          decoration: InputDecoration(labelText: "Transaction Amount"),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ElevatedButton(
            onPressed: () {
              addtx(namecontroller.text, int.parse(amountcontroller.text));
            },
            child: const Text('Add Transaction'))
      ],
    ));
  }
}
