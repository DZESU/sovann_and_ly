import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VenueSecion extends StatefulWidget {
  const VenueSecion({super.key});

  @override
  State<VenueSecion> createState() => _VenueSecionState();
}

class _VenueSecionState extends State<VenueSecion> {
  bool _titleAnimate = false;

  @override
  Widget build(BuildContext context) {
    final mapUrl = "https://maps.app.goo.gl/hLxmfccaN5huop8GA";
    return Column(
      children: [
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(16),
        //   child: Image.network(
        //     Asset.map,
        //     width: .8.sw,
        //   ),
        // ),
        Text(
          "Wedding Location",
          style: titleTextStyle,
        ),
        VisibilityDetector(
            onVisibilityChanged: (value) {
              setState(() {
                _titleAnimate = true;
              });
            },
            key: Key("Wedding Location"),
            child: Transform.scale(
                scale: 2.5,
                child: SizedBox(
                    height: 50,
                    child: Lottie.asset(Asset.decorLine,
                        repeat: false, animate: _titleAnimate)))),
        SizedBox(height: 16.h),
        SvgPicture.asset(Asset.mapSvg),
        SizedBox(height: 16),
        TextButton(
          onPressed: () {
            launchUrlString(mapUrl, mode: LaunchMode.externalApplication);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "View Map",
                style: baseTextStyle.copyWith(color: mainColor),
              ),
              SizedBox(width: 4),
              Icon(
                Symbols.location_pin,
                color: mainColor,
                size: 22,
              )
            ],
          ),
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              side: WidgetStatePropertyAll(BorderSide(color: mainColor))),
        ),
      ],
    );
  }
}
