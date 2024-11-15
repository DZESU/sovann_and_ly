import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final decorLeft = Image.network(Asset.weedLeft);
    final decorRight = Image.network(Asset.weedRight);
    final name = widget.name ?? (kDebugMode ? 'Sovann Pory' : '');
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 1.sh),
      child: Stack(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dear ",
                    style: baseTextStyle.copyWith(fontSize: 30),
                  ),
                  Flexible(
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          name.sentenceCase,
                          speed: Duration(milliseconds: 100),
                          textAlign: TextAlign.center,
                          textStyle: baseTextStyle.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: mainColor),
                          cursor: '|',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SlideInLeft(
                duration: Duration(milliseconds: 1000),
                delay: Duration(milliseconds: 500),
                child: FadeIn(
                  duration: Duration(milliseconds: 1000),
                  delay: Duration(milliseconds: 600),
                  child: Text(
                    "You are invited to the wedding of",
                    style: baseTextStyle.copyWith(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: 24),
              FadeInUp(
                  delay: Duration(seconds: 1),
                  child: Image.network(Asset.introductionMain)),
            ],
          )),
          Positioned(
              bottom: 0,
              left: -40,
              child: SizedBox(width: 120, child: decorLeft)),
        ],
      ),
    );
  }
}
