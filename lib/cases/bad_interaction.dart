import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class BadInteractionsPage extends StatelessWidget {
  const BadInteractionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Bad Interactions',
        body: Column(
          children: [
            // ex : swipe to dismiss
            if (MediaQuery.of(context).accessibleNavigation) const Text('Accessible Interaction'),
            if (!MediaQuery.of(context).accessibleNavigation) const Text('Inaccessible Interaction'),
          ],
        ));
  }
}
