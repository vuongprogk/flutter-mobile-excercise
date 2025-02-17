import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeListItem extends StatelessWidget {
  final Employee employee;

  const EmployeeListItem({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(employee.name),
        subtitle: Text(employee.phoneNumber),
        leading: CircleAvatar(child: Text(employee.name[0])),
      ),
    );
  }
}
