import 'package:flutter/material.dart';

class TextSizePage extends StatefulWidget {
  const TextSizePage({Key? key}) : super(key: key);

  @override
  State<TextSizePage> createState() => _TextSizePageState();
}

class _TextSizePageState extends State<TextSizePage> {
  double _currentTextSizeValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Text Size')),
        body: SingleChildScrollView(
          child: Column(
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
          ),
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
        style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
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
