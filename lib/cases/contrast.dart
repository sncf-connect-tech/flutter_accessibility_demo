import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class ContrastPage extends StatefulWidget {
  final Color? textColor;
  const ContrastPage({Key? key, this.textColor}) : super(key: key);

  @override
  State<ContrastPage> createState() => _ContrastPageState();
}

class _ContrastPageState extends State<ContrastPage> {
  bool isContrastOk = true;
  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Contrast ko',
        body: Column(
          children: [
            Switch(
              onChanged: (bool value) {
                setState(() {
                  isContrastOk = value!;
                });
              },
              value: isContrastOk,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 40,
                  color: isContrastOk ? Colors.black : Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      isContrastOk ? 'Good Contrast' : 'Bad Contrast',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: widget.textColor ?? Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
