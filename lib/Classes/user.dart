import 'package:flutter/foundation.dart';

class User {
  String username;
  String password;
  double weekly_budget;
  double monthly_budget;

  User(
      {required this.username,
      required this.password,
      this.weekly_budget = 0,
      this.monthly_budget = 0});

  void changeUsername(String username) {
    this.username = username;
  }

  void changePassword(String password) {
    this.password = password;
  }

  void setWeeklyBudget(double weeklyBudget) {
    this.weekly_budget = weeklyBudget;
  }

  void setMonthlyBudget(double monthlyBudget) {
    this.monthly_budget = monthlyBudget + 1;
  }
}
