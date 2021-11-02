import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class TapTargetSizePage extends StatelessWidget {
  const TapTargetSizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Tap Target Size',
        body: Container(
          color: Colors.black,
          child: TextButton(
            onPressed: () {
              print('Hello');
            },
            child: const Text(
              'Hello',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
