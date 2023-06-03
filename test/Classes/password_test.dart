import 'package:flutter_test/flutter_test.dart';
import 'package:personalexpense/Classes/user.dart';

void main() {
  test('Change password - Test 1', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.changePassword("Eshant@c18");
    expect(user.password, "Eshant@c18");
  });

  test('Change password - Test 2', () {
    // TODO: Implement test
    User user = User(username: 'Eshant', password: 'eshant');
    user.changePassword("Eshant@c18");
    expect(user.password, isNot("hello"));
  });

  test('Change password - Test 3', () {
    // TODO: Implement test
    User user = User(username: 'ROhan', password: 'rohan');
    user.changePassword("rohan@123");
    expect(user.password, 'rohan@123');
  });

  test('Change password - Test 4', () {
    // TODO: Implement test
    User user = User(username: 'Rohan', password: 'rohan');
    user.changePassword('ROhan@123432');
    expect(user.password, isNot("rohan"));
  });
}
