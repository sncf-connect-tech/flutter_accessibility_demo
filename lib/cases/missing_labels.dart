import 'package:flutter/material.dart';

class MissingLabelsPage extends StatelessWidget {
  const MissingLabelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Missing Labels')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage('images/tgv.jpeg'),
                  height: 80,
                  width: 80,
                ),
              )
            ],
          ),
        ));
  }
}
