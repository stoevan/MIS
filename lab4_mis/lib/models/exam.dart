import 'package:flutter/material.dart';
class Exam {
  final String subject;
  final DateTime date;
  final String location;
  final TimeOfDay time;
  final double locationLatitude;
  final double locationLongitude;

  Exam({
    required this.subject,
    required this.date,
    required this.location,
    required this.time,
    required this.locationLatitude,
    required this.locationLongitude,
  });
}