
import 'dart:math';

import 'package:flutter/material.dart';

class DebugBox extends StatelessWidget {
  const DebugBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:
          Colors.primaries[Random().nextInt(Colors.primaries.length - 1)],
        ),
      ),
      child: child,
    );
  }
}

