import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '64cbd77826b4cca75edcc2c7',
      name: 'Fatma3',
      email: 'Fatma3765@gmail.com',
      password: 'Fatma3',
      address: 'Banha',
      type: 'user',
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0Y2JkNzc4MjZiNGNjYTc1ZWRjYzJjNyIsImlhdCI6MTY5MTMwODkwOX0.PFmLMqZEkzMvFOJWRP46eAWGc8uVZ3QkK26m5osxV5M');

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
