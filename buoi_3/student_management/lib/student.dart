import 'package:flutter/material.dart';

class Student {
  final String id = UniqueKey().toString();
  final String name;
  final int age;
  final String grade;
  final String imageUrl;

  Student({
    required this.name,
    required this.age,
    required this.grade,
    required this.imageUrl,
  });
}

List<Student> generateSampleData() {
  return [
    Student(
      name: 'John Doe',
      age: 20,
      grade: 'A',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Jane Smith',
      age: 22,
      grade: 'B',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Alice Johnson',
      age: 21,
      grade: 'A',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Bob Brown',
      age: 23,
      grade: 'C',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Charlie Davis',
      age: 24,
      grade: 'B',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Diana Evans',
      age: 22,
      grade: 'A',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Ethan Foster',
      age: 21,
      grade: 'C',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Fiona Green',
      age: 23,
      grade: 'B',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'George Harris',
      age: 20,
      grade: 'A',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
    Student(
      name: 'Hannah Irving',
      age: 22,
      grade: 'C',
      imageUrl: 'https://www.w3schools.com/images/img_girl.jpg',
    ),
  ];
}
