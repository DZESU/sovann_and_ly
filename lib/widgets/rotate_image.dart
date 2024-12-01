import 'package:flutter/material.dart';
import 'package:sovann_and_ly/asset.dart';

class NameLogo extends StatelessWidget {
  const NameLogo({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        RotatingImage(
            child: Image.network(
          Asset.nameInitialBg,
          height: height,
        )),
        Image.network(Asset.nameInitial, height: height),
      ],
    );
  }
}

class RotatingImage extends StatefulWidget {
  final Widget child;

  const RotatingImage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _RotatingImageState createState() => _RotatingImageState();
}

class _RotatingImageState extends State<RotatingImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 60), // Duration of one full rotation
      vsync: this,
    )..repeat(); // Start the animation and loop continuously
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2.0 * 3.141592653589793, // Full rotation
            child: child,
          );
        },
        child: widget.child);
  }
}
