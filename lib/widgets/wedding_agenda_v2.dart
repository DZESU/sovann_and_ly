import 'package:flutter/material.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';

class WeddingAgendaV2 extends StatelessWidget {
  const WeddingAgendaV2({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: _leftSection()),
          VerticalDivider(
            color: mainColor,
            thickness: 2,
            width: 2,
          ),
          Expanded(child: _rightSection()),
        ],
      ),
    );
  }

  // •  06:30 AM: Groom’s Processional (Hae Kon Kom Loh)
  // •  08:15 AM: Ring Exchange and Honoring the Parents (Kat Khan Sla)
  // •  09:02 AM: Monks’ Blessing (Soat Mun)
  // •  09:35 AM: Hair Cutting Ritual (Kat sork)
  // •  10:32 AM: Knot Tying (Sompeas Ptem)
  // •  12:00 PM: Wedding Lunch
  // •  05:00 PM: Dinner Party

  Widget _leftSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _event(
          icon: Asset.cloth,
          time: "06:30 AM",
          label: "Groom’s Processional (Hae Kon Kom Loh)",
          isRight: false,
          visible: false,
        ),
        _event(
          icon: Asset.ring,
          time: "08:15 AM",
          label: "Ring Exchange & Honoring the Parents\n(Kat Khan Sla)",
          isRight: false,
          visible: true,
        ),
        _event(
          icon: Asset.monk,
          time: "09:02 AM",
          label: "Monks’ Blessing (Soat Mun)",
          isRight: false,
          visible: false,
        ),
        _event(
          icon: Asset.siccor,
          time: "09:35 AM",
          label: "Hair Cutting Ritual (Kat sork)",
          isRight: false,
          visible: true,
        ),
        _event(
          icon: Asset.heart,
          time: "10:32 AM",
          label: "Knot Tying (Sompeas Ptem)",
          isRight: false,
          visible: false,
        ),
        _event(
          icon: Asset.fork,
          time: "12:00 PM",
          label: "Wedding Lunch",
          isRight: false,
          visible: true,
        ),
        _event(
          icon: Asset.glasses,
          time: "05:00 PM",
          label: "Dinner Party",
          isRight: false,
          visible: false,
        ),
      ],
    );
  }

  Widget _rightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _event(
          icon: Asset.cloth,
          time: "06:30 AM",
          label: "Groom’s Processional (Hae Kon Kom Loh)",
          isRight: true,
          visible: true,
        ),
        _event(
          icon: Asset.ring,
          time: "08:15 AM",
          label: "Ring Exchange & Honoring the Parents\n(Kat Khan Sla)",
          isRight: true,
          visible: false,
        ),
        _event(
          icon: Asset.monk,
          time: "09:02 AM",
          label: "Monks’ Blessing (Soat Mun)",
          isRight: true,
          visible: true,
        ),
        _event(
          icon: Asset.siccor,
          time: "09:35 AM",
          label: "Hair Cutting Ritual (Kat sork)",
          isRight: true,
          visible: false,
        ),
        _event(
          icon: Asset.heart,
          time: "10:32 AM",
          label: "Knot Tying (Sompeas Ptem)",
          isRight: true,
          visible: true,
        ),
        _event(
          icon: Asset.fork,
          time: "12:00 PM",
          label: "Wedding Lunch",
          isRight: true,
          visible: false,
        ),
        _event(
          icon: Asset.glasses,
          time: "05:00 PM",
          label: "Dinner Party",
          isRight: true,
          visible: true,
        ),
      ],
    );
  }

  Widget _event({
    required String icon,
    required String time,
    required String label,
    required bool isRight,
    required bool visible,
  }) {
    final size = 45.0;
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(isRight)
            SizedBox(
              width: 20,
              child: Divider(
                color: mainColor,
                thickness: 2,
              ),
            ),
            if (isRight) Image.asset(icon, height: size, width: size),
            if (isRight) SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment:
                    isRight ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: baseTextStyle.copyWith(fontWeight: FontWeight.bold, color: mainColor),
                  ),
                  Text(
                    label,
                    style:
                        baseTextStyle.copyWith(fontWeight: FontWeight.normal),
                    textAlign: isRight ? TextAlign.start : TextAlign.end,
                  ),
                ],
              ),
            ),
            if (!isRight) SizedBox(width: 8),
            if (!isRight) Image.asset(icon, height: size, width: size),
            if(!isRight)
              SizedBox(
                width: 20,
                child: Divider(
                  color: mainColor,
                  thickness: 2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
