import 'package:flutter/material.dart';
import 'package:sovann_and_ly/app.dart';

import '../asset.dart';

class NameSection extends StatelessWidget {
  const NameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: .8.sh,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "The Wedding Of",
            style: baseTextStyle.copyWith(fontSize: 36, fontFamily: 'Andasia', color: mainColor),
          ),
          SizedBox(height: 24),
          Image.asset(Asset.initialName, height: 200),
          SizedBox(height: 32),
          Row(
            children: [
              Expanded(child: _name("Groom", "Pory\nSovann")),
              Expanded(child: _name("Bride", "Heng\nSreyly")),
            ],
          ),
          SizedBox(height: 36),
          Text(
            "SAVE THE DATE",
            style: baseTextStyle.copyWith(
                fontWeight: FontWeight.w300, fontSize: 20),
          ),
          Text(
            "Saturday 11th, January 2025",
            style: baseTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 28, color: mainColor),
          ),
        ],
      ),
    );
  }

  Widget _name(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: baseTextStyle.copyWith(fontSize: 25, color: mainColor),
        ),
        Text(
          value,
          style: baseTextStyle.copyWith(
              fontFamily: 'Andasia',
              fontSize: 35,
              fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
