import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String username;
  final String userID;
  final double weekly_Budget;
  final double monthly_Budget;

  // ignore: use_key_in_widget_constructors
  const UserDetails(
      this.username, this.userID, this.weekly_Budget, this.monthly_Budget);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.teal, width: 5, style: BorderStyle.solid),
      ),
      child: Column(children: [
        Card(
            margin: const EdgeInsets.all(7),
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(11),
              width: double.infinity,
              child: Text(
                'Username : ' + username,
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            )),
        Card(
            margin: const EdgeInsets.all(7),
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(11),
              width: double.infinity,
              child: Text(
                'UserID : ' + userID,
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            )),
        Card(
            margin: const EdgeInsets.all(7),
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(11),
              width: double.infinity,
              child: Text(
                'Weekly Budget : ' + weekly_Budget.toString(),
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            )),
        Card(
            margin: const EdgeInsets.all(7),
            elevation: 7,
            child: Container(
              padding: EdgeInsets.all(11),
              width: double.infinity,
              child: Text(
                'Monthly Budget : ' + monthly_Budget.toString(),
                style: const TextStyle(
                  color: Colors.black87,
                ),
              ),
            )),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),

        SizedBox(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
              elevation: 7,
            ),
            child: Text("Edit"),
            onPressed: () {},
          ),
        )

        // FloatingActionButton(
        //   child: Text("Edit"),
        //   onPressed: () {},
        //   elevation: 11,
        // )
      ]),
    );
  }
}
