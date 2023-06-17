import 'package:calculator/screen/input_section.dart';
import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyKeyboardSection extends StatelessWidget {
  const MyKeyboardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='(';
                  },
                  child: const Text(
                    '(',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+=')';
                  },
                  child: const Text(
                    ')',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    final String value = MyInputSection.input.value;
                    MyInputSection.input.value = value.substring(0, value.length-1);
                  },
                  child: const Icon(Icons.backspace_outlined)
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value = ''; // Return kosong
                  },
                  child: const Text(
                    'C',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ), // ( ) Del C
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='7';
                  },
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='8';
                  },
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='9';
                  },
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='/';
                  },
                  child: const Text(
                    '÷',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ), // 7 8 9 ÷
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='4';
                  },
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='5';
                  },
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='6';
                  },
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='*';
                  },
                  child: const Text(
                    '×',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ), // 4 5 6 ×
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='1';
                  },
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='2';
                  },
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='3';
                  },
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='-';
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ), // 1 2 3 -
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='.'; // Koma
                  },
                  child: const Text(
                    '.',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='0';
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    try {
                      final String value = Parser()
                          .parse(MyInputSection.input.value)
                          .evaluate(EvaluationType.REAL, ContextModel())
                          .toString();
                      MyInputSection.input.value = value;
                      if (MyInputSection.input.value.endsWith('.0')) {
                        MyInputSection.input.value = MyInputSection.input.value.substring(0, MyInputSection.input.value.length - 2);
                      }
                    } catch (e) {
                      MyInputSection.input.value = 'err';
                    }
                  },
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                MyCalculatorButton(
                  onPressed: () {
                    MyInputSection.input.value+='+';
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ), // . 0 = +
        ],
      )
    );
  }
}