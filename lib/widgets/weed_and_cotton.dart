import 'package:flutter/material.dart';

import '../asset.dart';

class WeedAndCotton extends StatelessWidget {
  const WeedAndCotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Asset.cotton),
        Image.asset(Asset.weed,width: 180,),
      ],
    );
  }
}
