import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamListWidget extends StatelessWidget {
  final List<Exam> selectedEvents;

  const ExamListWidget({Key? key, required this.selectedEvents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selectedEvents.length,
      itemBuilder: (context, index) {
        final exam = selectedEvents[index];
        return ListTile(
          title: Text(exam.subject),
          subtitle: Text(
            'Локација: ${exam.location}\nВреме: ${exam.time.format(context)}',
          ),
        );
      },
    );
  }
}
