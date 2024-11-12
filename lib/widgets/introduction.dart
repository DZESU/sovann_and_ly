import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key, this.name});
  final String? name;

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    final decorLeft = Image.asset(Asset.weedLeft);
    final decorRight = Image.asset(Asset.weedRight);
    final name = widget.name;
    return Stack(
      children: [
        Positioned(
            top: -20,
            right: -50,
            child: SizedBox(width: 140, child: decorRight)),
        SizedBox(
            // height: 1.sh,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Text(
                  "Wedding Invitation",
                  style: TextStyle(
                      fontSize: 40, fontFamily: "Andasia", color: mainColor),
                ),
                SizedBox(height: 24),
                Text.rich(
                    TextSpan(text: "Dear ", children: [
                      TextSpan(
                        text: name?.titleCase??'',
                        style: baseTextStyle.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold, color: mainColor),
                      )
                    ]),
                    style: baseTextStyle.copyWith(fontSize: 30),
                    textAlign: TextAlign.center),
                Text(
                  "You are invited to the wedding of",
                  style: baseTextStyle.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Image.asset(Asset.introductionMain),
              ],
            )),
        Positioned(
            bottom: 0,
            left: -40,
            child: SizedBox(width: 120, child: decorLeft)),
      ],
    );
  }

}
