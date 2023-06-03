import 'package:flutter/material.dart';
import '../Classes/transaction.dart'; // .. -> means level up folder
import 'package:intl/intl.dart';
// import 'package:currency_picker/currency_picker.dart';

class TransactionList extends StatelessWidget {
  late final List<Transaction> trans;
  Function deleteTransaction;
  // final Currency currency;

  // TransactionList(List<Transaction> trans, this.currency) {
  //   this.trans = sort(trans);
  // }

  // List<Transaction> sort(List<Transaction> trans) {
  //   return trans;
  // }

  TransactionList(this.trans, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        // Widget ListView() can also be used in place of SingleChildScrollView()
        // ListView basically is Column() + SingleChildScrollView()
        // ListView take infinite height, thus is wrappedaround by Container to specify height
        // ListView can be used as ListView(children:[]) using map method
        // This is useful when less number of items are pesent as it renders all widget even those that are not visible
        // Thus this affects performance for large number of items as extra memory is used
        /*
        child: ListView(
          children: trans.map((t) {
            return Card(
              child: Row(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.blueAccent,
                    width: 3,
                    style: BorderStyle.solid,
                  )),
                  padding: EdgeInsets.all(11),
                  child: Text(
                      // '\$' + t.price.toString(), // '\' before $ allows us to print $ as char
                      '\$${t.price}', // String Interpolation -> ${var} - Syntax to concat
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.title,
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text(
                      DateFormat.yMEd().format(
                          t.date), // DateFormat().format(date) formats date
                      style: TextStyle(color: Colors.brown, fontSize: 15),
                    ),
                  ],
                )
              ]),
            );
          }).toList(),
        )
        */
        child: trans.isEmpty
            ? Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('images/nothing_found.png', fit: BoxFit.fill),
                  const SizedBox(
                    // Used to have create boxes of fixed size
                    height: 15,
                  ),
                  Text("No transaction list"),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  // return Card(
                  //   margin: EdgeInsets.all(7),
                  //   elevation: 7,
                  //   child: ListTile(
                  //     // ListTile is used as it has a layout which contains leading, title, subtitle
                  //     leading: CircleAvatar(
                  //         radius: 30,
                  //         child: FittedBox(
                  //             fit: BoxFit.contain,
                  //             child: Text("₹${trans[index].price}"))),
                  //     title: Text("${trans[index].title}"),
                  //     subtitle:
                  //         Text(DateFormat.yMMMd().format(trans[index].date)),
                  //   ),
                  // );

                  return Card(
                    child: Row(children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                          padding: EdgeInsets.all(5),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  width: 3, color: Colors.brown.shade700)),
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Column(
                                children: [
                                  Text(
                                    DateFormat.MMM().format(trans[index].date),
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  Text(
                                    DateFormat.d().format(trans[index].date),
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ))),
                      Container(
                          width: 150,
                          height: 50,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 11, vertical: 11),
                          decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                // color: Colors.blueAccent,
                                // Use of theme colors below
                                color: Theme.of(context).primaryColorDark,
                                width: 3,
                                style: BorderStyle.solid,
                              )),
                          padding: EdgeInsets.all(11),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                                // '\$' + t.price.toString(), // '\' before $ allows us to print $ as char

                                trans[index]
                                    .title, // String Interpolation -> ${var} - Syntax to concat
                                style: TextStyle(
                                    color: Color.fromARGB(221, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                // currency.symbol,
                                "₹",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 155, 80),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${(trans[index].price).toStringAsFixed(2)}',
                                // style: Theme.of(context).textTheme.headline6,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.purple),
                              ),
                            ],
                          ),
                          // style: TextStyle(
                          //     color: Colors.purple,
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.bold)),

                          // Text(
                          //   DateFormat.yMEd().format(trans[index]
                          //       .date), // DateFormat().format(date) formats date
                          //   style: TextStyle(color: Colors.brown, fontSize: 15),
                          // ),
                        ],
                      ),
                      Flexible(child: Text(''), fit: FlexFit.tight),
                      IconButton(
                        onPressed: () {
                          deleteTransaction(trans[index].id);
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      ),
                    ]),
                  );
                },
                itemCount: trans.length,
              ));

    // ListView can also be used as ListView.builder() which has more optimisation provided by flutter
    // This is very useful even for large number of items as it renders only those widgets which are visible on screen
  }
}
