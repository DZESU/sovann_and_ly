import 'package:flutter/material.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';

class WeddingDetail extends StatelessWidget {
  const WeddingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: .7.sh,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Wedding Detail",
              style: baseTextStyle.copyWith(
                  fontSize: 36, fontFamily: 'Andasia'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _parentName(
                  "Mr. Tan Pory",
                  "Mrs. Meas Sophal",
                  CrossAxisAlignment.start,
                ),
                _parentName(
                  "Mr. Koy Porheng",
                  "Mrs. Im Vouchhour",
                  CrossAxisAlignment.end,
                ),
              ],
            ),
            SizedBox(height: 60),
            Row(
              children: [
                _childName("GROOM", "Pory", "Sovann"),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Image.asset(Asset.nameInitial),
                )),
                _childName("BRIDE", "Heng", "Sreyly"),
              ],
            ),
            SizedBox(height: 60),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Which will be held on",
                  style: baseTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "Saturday 11th, January 2025",
                  style: baseTextStyle.copyWith(
                    color: mainColor,
                      fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _parentName(
      String father, String mother, CrossAxisAlignment crossAxisAlignment) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          father,
          style: baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(mother, style: baseTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _childName(String label, String firstname, String lastname) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: baseTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: mainColor),
        ),
        SizedBox(height: 16),
        Text(firstname,
            style: baseTextStyle.copyWith(
              fontFamily: 'Madina',
              fontSize: 62,
              height: 1,
              fontWeight: FontWeight.w100,
            )),
        Text(lastname,
            style: baseTextStyle.copyWith(
              fontFamily: 'Madina',
              fontSize: 62,
              height: 1,
              fontWeight: FontWeight.w100,
            )),
      ],
    );
  }
}
