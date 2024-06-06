import 'dart:io';
import 'package:flutter/material.dart';

class ProfileController {
  static ValueNotifier<String?> avatar = ValueNotifier<String?>(null);
  static File? _avatar;
  static String _firstName = '';
  static String _lastName = '';
  static String _email = '';

  static void setAvatar(File avatar) {
    _avatar = avatar;
    avatar.path; // Notify ValueNotifier of change
  }

  static File? getAvatarPath() {
    return _avatar;
  }

  static String getFirstName() {
    return _firstName;
  }

  static String getLastName() {
    return _lastName;
  }

  static String getEmail() {
    return _email;
  }

  static void updateProfile(
      {File? avatar, String? firstName, String? lastName, String? email}) {
    if (avatar != null) {
      setAvatar(avatar);
    }
    if (firstName != null) _firstName = firstName;
    if (lastName != null) _lastName = lastName;
    if (email != null) _email = email;
  }

  static void clearProfile() {
    _avatar = null;
    _firstName = '';
    _lastName = '';
    _email = '';
    avatar.value = null;
  }
}
