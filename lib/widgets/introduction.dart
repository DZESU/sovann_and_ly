import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';
import 'package:sovann_and_ly/debug_box.dart';
import 'package:sovann_and_ly/widgets/weed_and_cotton.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    final weed = Image.asset(Asset.weed, width: 180);
    final cotton = Image.asset(Asset.cotton);
    final decorLeft = Image.asset(Asset.weedLeft);
    final decorRight = Image.asset(Asset.weedRight);
    return Stack(
      children: [
        SizedBox(
          height: 1.sh,
          child: Image.asset(
            Asset.introBg,
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(top: -20, right: -50, child: SizedBox(width: 140,child: decorRight)),

        SizedBox(height: 1.sh, child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Wedding Invitation",style: TextStyle(fontSize: 40, fontFamily:  "Andasia"),),
            SizedBox(height: 24),
            Image.asset(Asset.introductionMain),
          ],
        )),
        Positioned(bottom: 0, left: -40, child: SizedBox(width: 120,child: decorLeft)),
      ],
    );
  }

  Widget _mirror({required Widget child}) {
    return Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: child);
  }

  Widget _rotate({required Widget child, required double angle}) {
    return Transform.rotate(angle: angle, child: child);
  }
}
