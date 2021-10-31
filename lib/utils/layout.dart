import 'package:flutter/material.dart';

class DemoLayout extends StatelessWidget {
  final String title;
  final Widget body;
  const DemoLayout({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: SingleChildScrollView(
            child: body,
          )),
    );
  }
}
