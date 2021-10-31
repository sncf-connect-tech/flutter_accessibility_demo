import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class ContrastPage extends StatelessWidget {
  final Color? textColor;
  const ContrastPage({Key? key, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Contrast ko',
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  color: Colors.black,
                  child: Text(
                    'Bad Contrast',
                    style: TextStyle(color: textColor ?? Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
