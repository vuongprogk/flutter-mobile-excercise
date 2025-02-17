import 'package:flutter/material.dart';
import 'student_list.dart';
import 'student.dart';
import 'student_dialog.dart';

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

  void _showAddStudentDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StudentDialog(onAdd: _addStudent, onUpdate: null);
      },
    );
  }

  void _showUpdateStudentDialog(int index, Student student) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StudentDialog(
          student: student,
          onAdd: null,
          onUpdate: (updatedStudent) => _updateStudent(index, updatedStudent),
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
          onUpdate: _showUpdateStudentDialog,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStudentDialog,
        tooltip: 'Add Student',
        child: const Icon(Icons.add),
      ),
    );
  }
}
