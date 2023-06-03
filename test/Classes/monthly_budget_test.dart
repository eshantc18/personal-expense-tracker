import 'package:flutter_test/flutter_test.dart';
import 'package:personalexpense/Classes/user.dart';

void main() {
  test('Monthly budget - Test 1', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.setMonthlyBudget(6000);
    expect(user.monthly_budget, 6000);
  });

  test('Monthly budget - Test 2', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.setMonthlyBudget(8500);
    expect(user.monthly_budget, (8000));
  });

  test('Monthly budget - Test 3', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.setMonthlyBudget(1800);
    expect(user.monthly_budget, 1800);
  });

  test('Monthly budget - Test 4', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.setMonthlyBudget(19300);
    expect(user.monthly_budget, isNot(6000));
  });
}
