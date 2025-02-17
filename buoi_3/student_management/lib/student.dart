import 'package:flutter/material.dart';

class Student {
  final String id = UniqueKey().toString();
  final String name;
  final int age;
  final String grade;

  Student({required this.name, required this.age, required this.grade});
}

List<Student> generateSampleData() {
  return [
    Student(name: 'John Doe', age: 20, grade: 'A'),
    Student(name: 'Jane Smith', age: 22, grade: 'B'),
    Student(name: 'Alice Johnson', age: 21, grade: 'A'),
    Student(name: 'Bob Brown', age: 23, grade: 'C'),
    Student(name: 'Charlie Davis', age: 24, grade: 'B'),
    Student(name: 'Diana Evans', age: 22, grade: 'A'),
    Student(name: 'Ethan Foster', age: 21, grade: 'C'),
    Student(name: 'Fiona Green', age: 23, grade: 'B'),
    Student(name: 'George Harris', age: 20, grade: 'A'),
    Student(name: 'Hannah Irving', age: 22, grade: 'C'),
  ];
}
