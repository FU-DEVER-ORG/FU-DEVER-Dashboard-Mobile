import 'package:flutter/material.dart';

class ProfileStorage {
  static ValueNotifier<String> avatar = ValueNotifier<String>('');
  static String _avatar = '';
  static String _firstName = '';
  static String _lastName = '';
  static String _email = '';

  static void setAvatar(String avatar) {
    _avatar = avatar;
  }

  static String getAvatar() {
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

  // Update all profile information at once
  static void updateProfile(
      {String? avatar, String? firstName, String? lastName, String? email}) {
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
