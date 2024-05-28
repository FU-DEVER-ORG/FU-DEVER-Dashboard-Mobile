import 'dart:io';

import 'package:flutter/material.dart';

class ProfileController {
  static ValueNotifier<String> avatar = ValueNotifier<String>('');
  static File? _avatar;
  static String _firstName = '';
  static String _lastName = '';
  static String _email = '';

  static void setAvatar(File avatar) {
    _avatar = avatar;
  }

  static File? getAvatar() {
    return _avatar;
  }

  static void setFirstName(String firstName) {
    _firstName = firstName;
  }

  static String getFirstName() {
    return _firstName;
  }

  static void setLastName(String lastName) {
    _lastName = lastName;
  }

  static String getLastName() {
    return _lastName;
  }

  static void setEmail(String email) {
    _email = email;
  }

  static String getEmail() {
    return _email;
  }

  static void updateProfile(
      {File? avatar, String? firstName, String? lastName, String? email}) {
    if (avatar != null) {
      _avatar = avatar;
    }
    if (firstName != null) {
      _firstName = firstName;
    }
    if (lastName != null) {
      _lastName = lastName;
    }
    if (email != null) {
      _email = email;
    }
  }
}
