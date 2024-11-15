import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VenueSecion extends StatelessWidget {
  const VenueSecion({super.key});

  @override
  Widget build(BuildContext context) {
    final mapUrl = "https://maps.app.goo.gl/hLxmfccaN5huop8GA";
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            Asset.map,
            width: .8.sw,
          ),
        ),
        SizedBox(height: 16),
        TextButton(
          onPressed: () {
            launchUrlString(mapUrl,
                mode: LaunchMode.externalApplication);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("View Map", style: baseTextStyle.copyWith(color: mainColor),),
              SizedBox(width: 4),
              Icon(Symbols.location_pin, color: mainColor, size: 22,)
            ],
          ),
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            side: WidgetStatePropertyAll(BorderSide(color: mainColor))
          ),
        ),
      ],
    );
  }
}
