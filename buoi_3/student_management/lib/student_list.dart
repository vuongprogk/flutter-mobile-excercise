import 'package:flutter/material.dart';
import 'student.dart';
import 'student_list_item.dart';

class StudentList extends StatelessWidget {
  final List<Student> students;
  final Function(int) onDelete;
  final Function(int, Student) onUpdate;

  const StudentList({
    super.key,
    required this.students,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // Added Column widget
      children: [
        Expanded(
          child: CustomListView(
            students: students,
            onDelete: onDelete,
            onUpdate: onUpdate,
          ),
        ),
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Student> students;
  final Function(int) onDelete;
  final Function(int, Student) onUpdate;

  const CustomListView({
    super.key,
    required this.students,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return ListViewItem(
          student: student,
          onDelete: () => onDelete(index),
          onUpdate: (updatedStudent) {
            students[index] = updatedStudent;
            onUpdate(index, updatedStudent);
          },
        );
      },
    );
  }
}
