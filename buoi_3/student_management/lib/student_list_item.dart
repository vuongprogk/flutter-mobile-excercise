import 'package:flutter/material.dart';
import 'student.dart';

class ListViewItem extends StatelessWidget {
  final Student student;
  final VoidCallback onDelete;
  final Function(Student) onUpdate;

  const ListViewItem({
    super.key,
    required this.student,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(student.name),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirm Delete'),
              content: Text('Are you sure you want to delete this student?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Delete'),
                ),
              ],
            );
          },
        );
      },
      background: Container(color: Colors.red),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Container(
                width: 150,
                height: 150,
                color:
                    Colors.primaries[student.name.hashCode %
                        Colors.primaries.length],
                child: Center(
                  child: Text(
                    student
                        .name[0], // Display the first letter of the student's name
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      student.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Age: ${student.age}, Grade: ${student.grade}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, size: 28),
                onPressed: () {
                  // Example of updating student details
                  Student updatedStudent = Student(
                    name: student.name,
                    age: student.age + 1,
                    grade: student.grade,
                    imageUrl: student.imageUrl,
                  );
                  onUpdate(updatedStudent);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, size: 28),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm Delete'),
                        content: Text(
                          'Are you sure you want to delete this student?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              onDelete();
                              Navigator.of(context).pop();
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
