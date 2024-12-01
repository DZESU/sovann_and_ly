import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/debug_box.dart';
import 'package:sovann_and_ly/widgets/rotate_image.dart';
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
                      child: Image.network(
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
                    style: titleTextStyle,
                  ),
                ),
              ),
              SizedBox(height: 50),
              VisibilityDetector(
                key: Key('name_section_logo'),
                onVisibilityChanged: (info) {
                  setState(() {
                    _logoAnimate = true;
                  });
                },
                child: FadeIn(
                  delay: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                  animate: _logoAnimate,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 28),
                        child: NameLogo(height: 300,)
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Expanded(child: _name("Groom", "Pory\nSovann")),
                  Expanded(child: _name("Bride", "Heng\nSreyly")),
                ],
              ),
              SizedBox(height: 66),
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
        SizedBox(height: 16),
        Text(
          value,
          style: nameTextStyle.copyWith(
            fontSize: 62,
            height: 1,
            // fontWeight: FontWeight.w100,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
