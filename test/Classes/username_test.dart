import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:personalexpense/Classes/user.dart';

void main() {
  test('Change username - Test 1', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.changeUsername('eshantc18');
    expect(user.username, 'eshantc18');
  });

  test('Change username - Test 2', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.changeUsername('builder18');
    expect(user.username, isNot('Eshant'));
  });

  test('Change username - Test 3', () {
    // TODO: Implement test
    User user = User(username: 'Roshan', password: 'roshan');
    user.changeUsername('rohan231');
    expect(user.username, 'rohan231');
  });

  test('Change username - Test 4', () {
    // TODO: Implement test
    User user = User(username: 'Roshan', password: 'roshan');
    user.changeUsername('rohan231');
    expect(user.username, isNot('Roshan'));
  });
}
