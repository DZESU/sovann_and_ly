import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../asset.dart';

class NameSection extends StatefulWidget {
  const NameSection({super.key});

  @override
  State<NameSection> createState() => _NameSectionState();
}

class _NameSectionState extends State<NameSection> {
  bool _titleAnimate = false;
  bool _logoAnimate = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Positioned(
              top: 100,
              child: Opacity(
                  opacity: .2,
                  child: Transform.scale(
                      scale: 1.5,
                      child: Image.asset(
                        Asset.sakura,
                        width: 1.sw,
                        fit: BoxFit.fitWidth,
                      )))),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VisibilityDetector(
                onVisibilityChanged: (info) {
                  setState(() {
                    _titleAnimate = true;
                  });
                },
                key: Key('name_section_title'),
                child: FadeInDown(
                  animate: _titleAnimate,
                  delay: Duration(milliseconds: 500),
                  child: Text(
                    "The Wedding Of",
                    style: baseTextStyle.copyWith(
                        fontSize: 36, fontFamily: 'Andasia', color: mainColor),
                  ),
                ),
              ),
              SizedBox(height: 24),
              VisibilityDetector(
                key: Key('name_section_logo'),
                onVisibilityChanged: (info) {
                  setState(() {
                    _logoAnimate = true;
                  });
                },
                child: ZoomIn(
                  delay: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  animate: _logoAnimate,
                  child: FadeIn(
                    delay: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    animate: _logoAnimate,
                    child: Image.asset(Asset.initialName, height: 200),
                  ),
                ),
              ),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: mainColor),
              ),
            ],
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
