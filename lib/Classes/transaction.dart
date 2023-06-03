import 'package:flutter/foundation.dart';
// foundation.dart is imported to make use of @required

class Transaction {
  String id;
  String title;
  double price;
  DateTime date;

  Transaction(
      {required this.title,
      required this.id,
      required this.price,
      required this.date});
}
