import 'package:flutter/material.dart';
import 'student.dart';

class StudentDialog extends StatefulWidget {
  final Student? student;
  final Function(Student)? onAdd;
  final Function(Student)? onUpdate;

  const StudentDialog({super.key, this.student, this.onAdd, this.onUpdate});

  @override
  _StudentDialogState createState() => _StudentDialogState();
}

class _StudentDialogState extends State<StudentDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _age;
  late String _grade;
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      _name = widget.student!.name;
      _age = widget.student!.age;
      _grade = widget.student!.grade;
      _imageUrl = widget.student!.imageUrl;
    } else {
      _name = '';
      _age = 0;
      _grade = '';
      _imageUrl = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _name,
              decoration: const InputDecoration(labelText: 'Name'),
              onSaved: (value) => _name = value!,
            ),
            TextFormField(
              initialValue: _age.toString(),
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              onSaved: (value) => _age = int.parse(value!),
            ),
            TextFormField(
              initialValue: _grade,
              decoration: const InputDecoration(labelText: 'Grade'),
              onSaved: (value) => _grade = value!,
            ),
            TextFormField(
              initialValue: _imageUrl,
              decoration: const InputDecoration(labelText: 'Image URL'),
              onSaved: (value) => _imageUrl = value!,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final student = Student(
                    name: _name,
                    age: _age,
                    grade: _grade,
                    imageUrl: _imageUrl,
                  );
                  if (widget.onAdd != null) {
                    widget.onAdd!(student);
                  } else if (widget.onUpdate != null) {
                    widget.onUpdate!(student);
                  }
                  Navigator.of(context).pop();
                }
              },
              child: Text(widget.student == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
