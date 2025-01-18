import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lab4_mis/widgets/exam_list.dart';
import 'package:table_calendar/table_calendar.dart';
import '../models/exam.dart';

import '../services/data.dart';
import '../services/location_service.dart';
import '../widgets/calendar_widget.dart';



class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late Map<DateTime, List<Exam>> _events;
  late List<Exam> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;


  @override
  void initState() {
    super.initState();

    _events = examEvents;
    _selectedEvents = [];
  }

  Future<Position> _getUserLocation() async {

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {

      throw Exception("Location permission denied");
    }


    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Распоред за полагање')),
      body: Column(
        children: [
          CalendarWidget(
            focusedDay: _focusedDay,
            selectedDay: _selectedDay,
            calendarFormat: _calendarFormat,
            events: _events,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents = _events[selectedDay] ?? [];
              });
                LocationService.getUserLocation().then((position) {
                  for (var exam in _selectedEvents) {
                   if (LocationService.isUserNearExam(position, exam)) {

                     print('User is near the exam: ${exam.subject}');
                  }
                }
              }).catchError((error) {
                print('Error getting location: $error');
              });
             },


            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ExamListWidget(selectedEvents: _selectedEvents),
          ),
        ],
      ),
    );
  }
}
