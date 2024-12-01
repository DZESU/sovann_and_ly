import 'package:auto_size_text/auto_size_text.dart';
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
              "Wedding Details",
              style: titleTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              "PARENTS",
              style: baseTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600, color: mainColor),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _childName("GROOM", "Pory", "Sovann")),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Image.network(
                    Asset.nameInitial,
                    width: 150,
                  ),
                  ),
                ),
                Expanded(child: _childName("BRIDE", "Heng", "Sreyly")),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
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
    final style =
        baseTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          father,
          style: style,
        ),
        Text(
          mother,
          style: style,
        ),
      ],
    );
  }

  Widget _childName(String label, String firstname, String lastname) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoSizeText(
          label,
          maxLines: 1,
          style: baseTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: mainColor),
        ),
        SizedBox(height: 16),
        AutoSizeText("$firstname\n$lastname",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: nameTextStyle.copyWith(
              fontSize: 62,
              height: 1,
              fontWeight: FontWeight.w100,
            )),
        // AutoSizeText(lastname,
        //     maxLines: 1,
        //     style: baseTextStyle.copyWith(
        //       fontFamily: 'Madina',
        //       fontSize: 62,
        //       height: 1,
        //       fontWeight: FontWeight.w100,
        //     )),
      ],
    );
  }
}
