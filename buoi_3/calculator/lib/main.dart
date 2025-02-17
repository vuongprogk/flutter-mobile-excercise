import 'package:flutter/material.dart';
import 'calculator_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Calculator'),
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
  final CalculatorModel _calculatorModel = CalculatorModel();

  void _buttonPressed(String buttonText) {
    setState(() {
      _calculatorModel.buttonPressed(buttonText);
    });
  }

  Widget _buildButton(
    String buttonText, {
    Color? color,
    Color? textColor,
    int flex = 1,
  }) {
    return Container(
      margin: EdgeInsets.all(1),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.grey[850],
          foregroundColor: textColor ?? Colors.white,
          padding: EdgeInsets.all(24),
        ),
        onPressed: () => _buttonPressed(buttonText),
        child: Text(buttonText, style: TextStyle(fontSize: 24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color of the Scaffold
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.black),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _calculatorModel.operation,
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                  Text(
                    _calculatorModel.output,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color:
                Colors
                    .black, // Set the background color of the button container
            child: Table(
              children: [
                TableRow(
                  children: [
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/", color: Colors.orange),
                  ],
                ),
                TableRow(
                  children: [
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*", color: Colors.orange),
                  ],
                ),
                TableRow(
                  children: [
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-", color: Colors.orange),
                  ],
                ),
                TableRow(
                  children: [
                    _buildButton("C", color: Colors.grey),
                    _buildButton("0"),
                    _buildButton("=", color: Colors.orange),
                    _buildButton("+", color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
