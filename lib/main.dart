import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraUI(),
    );
  }
}

class CalculadoraUI extends StatelessWidget {
  const CalculadoraUI({super.key});

  Widget buildButton(String text, {
    int flex = 1,
    bool isOperator = false,
    bool isAction = false,
  }) {
    Color backgroundColor;

    if (isOperator) {
      backgroundColor = const Color(0xFFFEA82F);
    } else if (isAction) {
      backgroundColor = const Color(0xFFE63946);
    } else {
      backgroundColor = const Color(0xFFEDF2F4);
    }

    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          onPressed: () {}, // Lógica aún no implementada
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: isOperator || isAction ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2D42),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Divider(color: Colors.white24),
            Column(
              children: [
                Row(
                  children: [
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/', isOperator: true),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('×', isOperator: true),
                  ],
                ),
                Row(
                  children: [
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-', isOperator: true),
                  ],
                ),
                Row(
                  children: [
                    buildButton('0', flex: 2),
                    buildButton('.'),
                    buildButton('+', isOperator: true),
                  ],
                ),
                Row(
                  children: [
                    buildButton('C', isAction: true),
                    buildButton('=', isOperator: true),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
