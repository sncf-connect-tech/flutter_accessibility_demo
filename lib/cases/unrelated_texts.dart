import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class UnrelatedTextsPage extends StatefulWidget {
  const UnrelatedTextsPage({Key? key}) : super(key: key);

  @override
  State<UnrelatedTextsPage> createState() => _UnrelatedTextsPageState();
}

class _UnrelatedTextsPageState extends State<UnrelatedTextsPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Unrelated Texts',
        body: Column(
          children: [
            const CheckboxUnrelatedLabel(),
            const SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              title: const Text('Check Me'),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
              secondary: const Icon(Icons.train),
            )
          ],
        ));
  }
}

class CheckboxUnrelatedLabel extends StatefulWidget {
  const CheckboxUnrelatedLabel({Key? key}) : super(key: key);

  @override
  _CheckboxUnrelatedLabelState createState() => _CheckboxUnrelatedLabelState();
}

class _CheckboxUnrelatedLabelState extends State<CheckboxUnrelatedLabel> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const SizedBox(
              width: 2,
            ),
            const Icon(Icons.train),
            const SizedBox(
              width: 33,
            ),
            const Expanded(child: Text('Check Me')),
            Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {},
            )
          ],
        ),
      ),
    );
  }
}
