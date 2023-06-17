import 'package:flutter/material.dart';

class MyCalculatorButton extends StatelessWidget {
  const MyCalculatorButton({
    Key? key,
    required this.onPressed,
    required this.child
  }) : super(key: key);

  final Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}