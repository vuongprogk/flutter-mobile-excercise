import 'package:flutter/material.dart';
import '../models/employee.dart';
import 'employee_list_item.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> employees;
  final Function(int) onTap;
  final Function(int) onLongPress;

  const EmployeeList({
    super.key,
    required this.employees,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        final employee = employees[index];
        return GestureDetector(
          onTap: () => onTap(index),
          onLongPress: () => onLongPress(index),
          child: EmployeeListItem(employee: employee),
        );
      },
    );
  }
}
