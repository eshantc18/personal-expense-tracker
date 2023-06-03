import 'package:flutter_test/flutter_test.dart';
import 'package:personalexpense/Classes/user.dart';

void main() {
  test('Weekly budget - Test 1', () {
    User user = User(username: 'Rohan', password: 'rohan');
    user.setWeeklyBudget(700);
    expect(user.weekly_budget, 700);
  });

  test('Weekly budget - Test 2', () {
    User user = User(username: 'Rohan', password: 'rohan');
    user.setWeeklyBudget(1500);
    expect(user.weekly_budget, isNot(700));
  });

  test('Weekly budget - Test 3', () {
    User user = User(username: 'Rohan', password: 'rohan');
    user.setWeeklyBudget(8400);
    expect(user.weekly_budget, isNot(6400));
  });

  test('Weekly budget - Test 4', () {
    User user = User(username: 'Rohan', password: 'rohan');
    user.setWeeklyBudget(140);
    expect(user.weekly_budget, isNot(110));
  });
}
