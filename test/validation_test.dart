import 'package:flutter_test/flutter_test.dart';
import '../lib/login_screen.dart'; 

void main() {
  test('validates correct email format', () {
    expect(validateEmail('test@example.com'), true);
    expect(validateEmail('wrong@'), false);
  });

  test('validates password length', () {
    expect(validatePassword('123456'), true);
    expect(validatePassword('123'), false);
  });
}