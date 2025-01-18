import 'package:flutter/material.dart';
import 'package:lab4_mis/screens/schedule_screen.dart';
import 'package:lab4_mis/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the notification service here
  // await NotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,

      home:ScheduleScreen()
    );
  }
}

