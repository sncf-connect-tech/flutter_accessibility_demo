import 'package:flutter/material.dart';
import 'package:flutter_accessibility_demo/utils/layout.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MissingLabelsPage extends StatelessWidget {
  const MissingLabelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoLayout(
        title: 'Missing Labels',
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image(
                image: const AssetImage('images/tgv.jpeg'),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              'svg/switch--on.svg',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
