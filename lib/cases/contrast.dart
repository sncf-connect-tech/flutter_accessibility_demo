import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class ContrastPage extends StatefulWidget {
  final bool? isContrastOk;
  const ContrastPage({Key? key, this.isContrastOk}) : super(key: key);

  @override
  State<ContrastPage> createState() => _ContrastPageState();
}

class _ContrastPageState extends State<ContrastPage> {
  late bool isContrastOk;

  @override
  void initState() {
    isContrastOk = widget.isContrastOk ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Contrast ko',
        body: Column(
          children: [
            Switch(
              onChanged: (bool value) {
                setState(() {
                  isContrastOk = value;
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
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
