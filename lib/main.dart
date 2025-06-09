import 'package:flutter/material.dart';
import 'login_screen.dart'; // Імпортуємо файл, який ти надіслав

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: LoginScreen(), // використовуємо твій екран
      ),
    );
  }
}