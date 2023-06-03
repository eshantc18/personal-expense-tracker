import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// newTransaction() widget is converted to StatefulWidget bcoz On emulator
// when input data Title is mentioned before amount then Title is vanised and vise-versa
// this happens so due to the fact that flutter revisits all widget and their no mechanism
// that stops this is in StatelessWidget
class newTransaction extends StatefulWidget {
  final Function addTransaction;

  const newTransaction(this.addTransaction);

  @override
  State<newTransaction> createState() => _newTransactionState();
}

class _newTransactionState extends State<newTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();

  void OnCLick() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) return;

    // widget. -> gives access to properties of class newTransaction
    widget.addTransaction(
        titleController.text,
        double.parse(amountController.text),
        DateTime.parse(dateController.text));

    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.fromLTRB(11, 11, 11, 11),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.teal,
        width: 5,
      )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        TextField(
          // onChanged: (value) => titleInput = value,
          controller: titleController,
          keyboardType: TextInputType.text,
          maxLength: 12,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
          // Onsubmitted takes String as argument
          // thus use '_' to show that arg is noted but of no use
          onSubmitted: (_) => OnCLick(),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          // onChanged: (value) => amountInput = value,
          controller: amountController,
          maxLength: 6,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          keyboardType: TextInputType.number,
          // Use below for iOS
          // keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Amount',
          ),
          onSubmitted: (_) => OnCLick(),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: dateController,
          keyboardType: TextInputType.datetime,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Date',
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime.now());

            if (pickedDate != null) {
              print(pickedDate);
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);

              setState(() {
                dateController.text = formattedDate;
              });
            }
          },
          onSubmitted: (_) => OnCLick(),
        ),
        SizedBox(
          height: 20,
        ),
        const Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 20)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor),
            onPressed: OnCLick,
            child: const Text(
              'Add',
            )),
      ]),
    ));
  }
}
