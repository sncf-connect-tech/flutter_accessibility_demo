import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class TextSizePage extends StatefulWidget {
  final double? initPoliceSize;

  const TextSizePage({Key? key, this.initPoliceSize}) : super(key: key);

  @override
  State<TextSizePage> createState() => _TextSizePageState();
}

class _TextSizePageState extends State<TextSizePage> {
  late double _currentTextSizeValue;

  @override
  void initState() {
    _currentTextSizeValue = widget.initPoliceSize ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Text Size',
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20), child: Text('Taille du texte')),
            Slider(
              value: _currentTextSizeValue,
              min: 1,
              max: 3,
              divisions: 2,
              label: _currentTextSizeValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentTextSizeValue = value;
                });
              },
            ),
            ButtonWithPadding(
              text: 'Text court',
              currentTextSizeValue: _currentTextSizeValue,
            ),
            ButtonWithPadding(
              text: 'Text plus long',
              currentTextSizeValue: _currentTextSizeValue,
            ),
            ButtonWithPadding(
              text: 'Text relativement trop long',
              currentTextSizeValue: _currentTextSizeValue,
            ),
            ButtonWithPadding(
              text: 'Text très très looong qui prend trop de place',
              currentTextSizeValue: _currentTextSizeValue,
            )
          ],
        ));
  }
}

class ButtonWithPadding extends StatelessWidget {
  final double currentTextSizeValue;
  final String text;
  const ButtonWithPadding({Key? key, required this.currentTextSizeValue, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          textScaleFactor: currentTextSizeValue,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
