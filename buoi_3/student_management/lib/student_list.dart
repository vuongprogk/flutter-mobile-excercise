import 'package:flutter/material.dart';
import 'student.dart';

class StudentList extends StatelessWidget {
  final List<Student> students;
  final Function(int) onDelete;
  final Function({int? index}) onUpdate;

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
          child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(student.name),
                  subtitle: Text(
                    'Age: ${student.age}, Grade: ${student.grade}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onDelete(index),
                  ),
                  onTap: () => onUpdate(index: index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
