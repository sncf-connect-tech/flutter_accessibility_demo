import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class NoStatePage extends StatefulWidget {
  final bool initiallyExpanded;

  const NoStatePage({Key? key, required this.initiallyExpanded}) : super(key: key);

  @override
  State<NoStatePage> createState() => _NoStatePageState();
}

class _NoStatePageState extends State<NoStatePage> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.initiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'No State',
        body: Column(
          children: [
            ExpansionTile(
              title: const Text('Cliquez ici (sans état)'),
              children: [
                Container(
                  color: Colors.grey,
                  child: const Text('Hello there'),
                ),
              ],
              initiallyExpanded: widget.initiallyExpanded,
            ),
            const SizedBox(
              height: 20,
            ),
            ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              title: Semantics(label: isExpanded ? 'Ouvert' : 'Fermé', child: const Text('Cliquez ici (avec état)')),
              children: [
                Container(
                  color: Colors.grey,
                  child: const Text('Hello there'),
                ),
              ],
              initiallyExpanded: widget.initiallyExpanded,
            )
          ],
        ));
  }
}
