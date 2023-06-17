import 'package:flutter/material.dart';

class MyInputSection extends StatelessWidget {
  const MyInputSection({Key? key}) : super(key: key);

  static final ValueNotifier<String> input = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(padding: EdgeInsets.all(16),
          child: ValueListenableBuilder(
            valueListenable: input,
            builder: (context, String value, child) {
              String newValue = value;
              newValue = newValue.replaceAll('*', '×');
              newValue = newValue.replaceAll('/', '÷');
              return SelectableText( // Untuk text bisa dicopy
                value.isEmpty?'0' : newValue,
                style: TextStyle(fontSize: 50),
              );
            }
          ),
        ),
      ),
    );
  }
}