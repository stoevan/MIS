import '../models/exam.dart';
import 'package:flutter/material.dart';

final Map<DateTime, List<Exam>> examEvents = {
  DateTime.utc(2025, 1, 15): [
    Exam(
      subject: 'Напредно програмирање',
      date: DateTime.utc(2025, 1, 15),
      location: '215',
      time: TimeOfDay(hour: 14, minute: 0),
      locationLatitude: 41.9981,
      locationLongitude: 21.4254,
    ),
  ],
  DateTime.utc(2025, 1, 17): [
    Exam(
      subject: 'Веб програмирање',
      date: DateTime.utc(2025, 1, 17),
      location: '138',
      time: TimeOfDay(hour: 12, minute: 30),
      locationLatitude: 41.9999,
      locationLongitude: 21.4265,
    ),
  ],
  DateTime.utc(2025, 1, 20): [
    Exam(
      subject: 'Бази на Податоци',
      date: DateTime.utc(2025, 1, 20),
      location: 'Лаб 13',
      time: TimeOfDay(hour: 9, minute: 0),
      locationLatitude: 41.9977,
      locationLongitude: 21.4238,
    ),
  ],
};
