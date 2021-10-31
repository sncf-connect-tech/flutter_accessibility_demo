import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';

class LandscapePage extends StatelessWidget {
  const LandscapePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
      title: 'Landscape',
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Hello',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Click bottom to buy some tickets',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Buy',
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      fab: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: ElevatedButton(
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 100,
              child: const Center(child: Text('Help Me', textAlign: TextAlign.center))),
          onPressed: () {},
        ),
      ),
    );
  }
}
