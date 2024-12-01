import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
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
    final decorLeft = Image.network(Asset.sakura3);
    final decorRight = Image.network(Asset.sakura3);
    final name = widget.name ?? (kDebugMode ? 'Sovann Pory' : '');
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 1.sh),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: -20,
              child: SizedBox(width: 140, child: Opacity(opacity: .5,child: decorRight))),
          SizedBox(
              // height: 1.sh,
              child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Text(
                "Wedding Invitation",
                style: titleTextStyle,
              ),
              Transform.scale(scale: 2.5,child: SizedBox(height: 50,child: Lottie.asset(Asset.decorLine, repeat: false, animate: true))),
              SizedBox(height: 24),
              if(name.isNotEmpty)
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
                          name.titleCase,
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
                    style: baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
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
              left: 0,
              child: SizedBox(width: 120, child: decorLeft)),
        ],
      ),
    );
  }
}
