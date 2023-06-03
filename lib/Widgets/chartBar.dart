import 'package:flutter/material.dart';
// import 'package:currency_picker/currency_picker.dart';

class chartBar extends StatelessWidget {
  final String weekDay;
  final double totalSum;
  final double percentage_in_week;
  // final Currency currency;

  // chartBar(this.weekDay, this.totalSum, this.percentage_in_week, this.currency);
  chartBar(this.weekDay, this.totalSum, this.percentage_in_week);

  @override
  Widget build(BuildContext buildcontext) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Row(
                  children: [
                    const Text(
                      // currency.symbol,
                      "₹",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 155, 80),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('${totalSum.toStringAsFixed(0)}'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.55,
              width: 20,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyan, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage_in_week,
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Color.fromARGB(255, 149, 0, 255),
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //     color: Theme.of(context).primaryColorDark, width: 1.0),
                      ),
                    ),
                  )
                ],
              ), // Allows widgets to overlap each other in bottom to top
            ),
            SizedBox(
              height: constraints.maxHeight * 0.025,
            ),
            Container(
              height: constraints.maxHeight * 0.1,
              child: Text(weekDay),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.025,
            )
          ],
        ),
      );
    }));
  }
}
