// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class UserViewmodel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;

  String? get firstName => _firstName;
  String? get lastName => _lastName;

  set firstName(String? firstName) {
    _firstName = firstName;
  }

  set lastName(String? lastName) {
    _lastName = lastName;
  }
}
