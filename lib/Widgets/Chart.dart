import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './chartBar.dart';
import '../Classes/transaction.dart';
import 'package:currency_picker/currency_picker.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  // final Currency currency;

  // Chart(this.recentTransactions, this.currency);
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var weekDayTotal = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          weekDayTotal += recentTransactions[i].price;
        }

        print(DateFormat.E().format(weekDay));
        print(weekDayTotal);
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': weekDayTotal};
    }).reversed.toList();
  }

  double get total_of_week {
    return groupedTransaction.fold(0.0, (sum, trans) {
      return sum + (trans['amount'] as double);
    });
  }

  Widget build(BuildContext context) {
    return Card(
      // Card is wrapped around by 'Container' bcoz it takes size of its child which is 'Text'
      // child: Text('Chart'), // Size of Text = String in it
      // color: Color(0xff06cb10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              width: 3,
              color: Theme.of(context).primaryColorDark,
              style: BorderStyle.solid),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map((data) {
            return Flexible(
                // Flexible is used to adjust spaces
                // flex makes available porportional space with respect to total spaces available
                // Flexfit.tight fill all available spaces + child
                // Also Expanded widget can used if fit = FlexFit.tight
                // Flexfit.loose takes as much as its child
                fit: FlexFit.tight,
                child: chartBar(
                  data['day'] as String,
                  data['amount'] as double,
                  total_of_week == 0.0
                      ? 0.0
                      : ((data['amount'] as double) / total_of_week),
                  // currency,
                ));
          }).toList(),
        ),
      ),
      elevation: 7,
    );
  }
}
