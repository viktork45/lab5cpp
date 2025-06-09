import 'package:flutter_test/flutter_test.dart';
import 'package:lab5_flutter/login_screen.dart'; // або шлях до твого файлу

void main() {
  test('validates correct email format', () {
    expect(validateEmail('test@example.com'), true);
    expect(validateEmail('invalid'), false);
  });

  test('validates password length', () {
    expect(validatePassword('123456'), true);
    expect(validatePassword('123'), false);
  });
}