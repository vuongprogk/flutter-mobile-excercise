import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../widgets/employee_list.dart';
import 'add_employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Employee> _employees = [
    Employee(id: 1, name: 'John Doe', phoneNumber: '123-456-7890'),
    Employee(id: 2, name: 'Jane Smith', phoneNumber: '987-654-3210'),
    Employee(id: 3, name: 'Alice Johnson', phoneNumber: '555-123-4567'),
    Employee(id: 4, name: 'Bob Brown', phoneNumber: '555-987-6543'),
    Employee(id: 5, name: 'Charlie Davis', phoneNumber: '555-555-5555'),
  ];

  void _addEmployee(Employee employee) {
    setState(() {
      _employees.add(employee);
    });
  }

  void _editEmployee(int index, Employee employee) {
    setState(() {
      _employees[index] = employee;
    });
  }

  void _deleteEmployee(int index) {
    setState(() {
      _employees.removeAt(index);
    });
  }

  Future<void> _confirmDelete(int index) async {
    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Delete'),
            content: const Text(
              'Are you sure you want to delete this employee?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
    if (result == true) {
      _deleteEmployee(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: EmployeeList(
        employees: _employees,
        onTap: (index) async {
          final editedEmployee = await Navigator.push<Employee>(
            context,
            MaterialPageRoute(
              builder: (context) => AddEmployee(employee: _employees[index]),
            ),
          );
          if (editedEmployee != null) {
            _editEmployee(index, editedEmployee);
          }
        },
        onLongPress: (index) => _confirmDelete(index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEmployee = await Navigator.push<Employee>(
            context,
            MaterialPageRoute(builder: (context) => const AddEmployee()),
          );
          if (newEmployee != null) {
            _addEmployee(newEmployee);
          }
        },
        tooltip: 'Add Employee',
        child: const Icon(Icons.add),
      ),
    );
  }
}
