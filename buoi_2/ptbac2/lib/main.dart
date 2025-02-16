import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quadratic Equation Solver',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Quadratic Equation Solver'),
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
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _result = '';

  void _solveEquation() {
    final double a = double.tryParse(_aController.text) ?? 0;
    final double b = double.tryParse(_bController.text) ?? 0;
    final double c = double.tryParse(_cController.text) ?? 0;

    if (a == 0) {
      setState(() {
        _result = 'Coefficient a cannot be 0';
      });
      return;
    }

    final double discriminant = b * b - 4 * a * c;
    if (discriminant < 0) {
      setState(() {
        _result = 'No real solutions';
      });
    } else {
      final double x1 = (-b + sqrt(discriminant)) / (2 * a);
      final double x2 = (-b - sqrt(discriminant)) / (2 * a);
      setState(() {
        _result = 'x1 = $x1, x2 = $x2';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Enter coefficients for ax^2 + bx + c = 0:'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _aController,
                decoration: const InputDecoration(labelText: 'a'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _bController,
                decoration: const InputDecoration(labelText: 'b'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _cController,
                decoration: const InputDecoration(labelText: 'c'),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 20),
            Text(_result, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _solveEquation,
        tooltip: 'Solve',
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
