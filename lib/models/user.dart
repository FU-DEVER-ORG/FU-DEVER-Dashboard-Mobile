import 'dart:io';

import 'package:meta/meta.dart';
import 'dart:convert';

class User {
  final String? id;
  final String email;
  final String password;
  final String? description;
  final File avatar;
  final String? nickname;
  final String? phone;
  final String? firstname;
  final String? lastname;
  final DateTime? dob;
  final String? hometown;
  final String? positionId;
  final String? departmentId;
  final String? job;
  final String? workplace;
  final String? school;
  final String? majorId;
  final DateTime? dateJoin;
  final List<String>? favourites;
  final List<String>? skills;
  final bool isExcellent;
  final bool isAdmin;

  User({
    this.id,
    required this.email,
    required this.password,
    this.description,
    required this.avatar,
    this.nickname,
    this.phone,
    this.firstname,
    this.lastname,
    this.dob,
    this.hometown,
    this.positionId,
    this.departmentId,
    this.job,
    this.workplace,
    this.school,
    this.majorId,
    this.dateJoin,
    this.favourites,
    this.skills,
    required this.isExcellent,
    required this.isAdmin,
  });

  // Factory method to create a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      description: json['description'],
      avatar: json['avatar'],
      nickname: json['nickname'],
      phone: json['phone'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      dob: json['dob'] != null ? DateTime.parse(json['dob']) : null,
      hometown: json['hometown'],
      positionId: json['positionId'],
      departmentId: json['departmentId'],
      job: json['job'],
      workplace: json['workplace'],
      school: json['school'],
      majorId: json['majorId'],
      dateJoin: json['dateJoin'] != null ? DateTime.parse(json['dateJoin']) : null,
      favourites: json['favourites'] != null ? List<String>.from(json['favourites']) : [],
      skills: json['skills'] != null ? List<String>.from(json['skills']) : [],
      isExcellent: json['isExcellent'],
      isAdmin: json['isAdmin'],
    );
  }

  // Method to convert a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'description': description,
      'avatar': avatar,
      'nickname': nickname,
      'phone': phone,
      'firstname': firstname,
      'lastname': lastname,
      'dob': dob?.toIso8601String(),
      'hometown': hometown,
      'positionId': positionId,
      'departmentId': departmentId,
      'job': job,
      'workplace': workplace,
      'school': school,
      'majorId': majorId,
      'dateJoin': dateJoin?.toIso8601String(),
      'favourites': favourites,
      'skills': skills,
      'isExcellent': isExcellent,
      'isAdmin': isAdmin,
    };
  }
}
