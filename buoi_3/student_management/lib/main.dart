import 'package:flutter/material.dart';
import 'student_list.dart';
import 'student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Student> students = generateSampleData();
  Student? _recentlyDeletedStudent;
  int? _recentlyDeletedStudentIndex;

  void _addStudent(Student student) {
    setState(() {
      students.add(student);
    });
  }

  void _updateStudent(int index, Student student) {
    setState(() {
      students[index] = student;
    });
  }

  void _deleteStudent(int index) {
    setState(() {
      _recentlyDeletedStudent = students.removeAt(index);
      _recentlyDeletedStudentIndex = index;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${_recentlyDeletedStudent!.name} deleted'),
        action: SnackBarAction(label: 'Undo', onPressed: _undoDelete),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void _undoDelete() {
    if (_recentlyDeletedStudent != null &&
        _recentlyDeletedStudentIndex != null) {
      setState(() {
        students.insert(
          _recentlyDeletedStudentIndex!,
          _recentlyDeletedStudent!,
        );
      });
    }
  }

  void _showAddStudentDialog({int? index}) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final gradeController = TextEditingController();

    if (index != null) {
      final student = students[index];
      nameController.text = student.name;
      ageController.text = student.age.toString();
      gradeController.text = student.grade;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add New Student' : 'Update Student'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: gradeController,
                  decoration: const InputDecoration(labelText: 'Grade'),
                ),
              ],
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final age = int.tryParse(ageController.text) ?? 0;
                final grade = gradeController.text;

                if (name.isNotEmpty && age > 0 && grade.isNotEmpty) {
                  if (index == null) {
                    _addStudent(Student(name: name, age: age, grade: grade));
                  } else {
                    _updateStudent(
                      index,
                      Student(name: name, age: age, grade: grade),
                    );
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Text(index == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: StudentList(
          students: students,
          onDelete: _deleteStudent,
          onUpdate: _showAddStudentDialog,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddStudentDialog(),
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
    );
  }
}
