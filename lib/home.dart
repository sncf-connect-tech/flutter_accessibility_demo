import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/cases/missing_labels.dart';
import 'package:flutter_accessibility_demo/cases/no_state.dart';
import 'package:flutter_accessibility_demo/cases/text_size.dart';
import 'package:flutter_accessibility_demo/cases/unrelated_texts.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Welcome in Accessibility App !'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Text Size'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextSizePage(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Contrast'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Missing Labels'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MissingLabelsPage(),
                    ));
              },
            ),
            ListTile(
              title: const Text('No State'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NoStatePage(
                        initiallyExpanded: false,
                      ),
                    ));
              },
            ),
            ListTile(
              title: const Text('Unrelated Texts'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UnrelatedTextsPage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
