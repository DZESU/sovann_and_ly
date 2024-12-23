import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';
import 'package:sovann_and_ly/debug_box.dart';
import 'package:visibility_detector/visibility_detector.dart';

class WeddingAgendaV2 extends StatefulWidget {
  const WeddingAgendaV2({super.key});

  @override
  State<WeddingAgendaV2> createState() => _WeddingAgendaV2State();
}

class _WeddingAgendaV2State extends State<WeddingAgendaV2> {
  final animate = List.generate(7, (_) => false);
  delay(int index) => Duration(milliseconds: 00 + (100 * index));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: _leftSection()),
        SizedBox(
          height: 600,
          child: VerticalDivider(
            color: mainColor,
            thickness: 2,
            width: 2,
            indent: 0,
            endIndent: 0,
          ),
        ),
        Container(
          width: 1,
          color: mainColor,
        ),
        Flexible(child: _rightSection()),
      ],
    );
  }

  Widget _leftSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _event(
          icon: Asset.cloth,
          time: "06:30 AM",
          label: "Groom’s Procession\n(ពិធីហែជំនូន)",
          isRight: false,
          visible: false,
        ),
        _event(
          icon: Asset.ring,
          time: "08:15 AM",
          label: "Ring Exchange\n& Honoring the Parents\n(ពិធីបំពាក់ចិញ្ចៀន និងកាត់ខាន់ស្លា)",
          isRight: false,
          visible: true,
          index: 1,
        ),
        _event(
          icon: Asset.monk,
          time: "09:02 AM",
          label: "Monks’ Blessing\n(ពិធីសូត្រមន្ត)",
          isRight: false,
          visible: false,
        ),
        _event(
          icon: Asset.siccor,
          time: "09:35 AM",
          label: "Hair Cutting\n(ពិធីកាត់សក់)",
          isRight: false,
          visible: true,
          index: 3,
        ),
        _event(
          icon: Asset.heart,
          time: "10:32 AM",
          label: "Knot Tying\n(ពិធីសំពះផ្ទឹម)",
          isRight: false,
          visible: false,
        ),
        _event(
          icon: Asset.fork,
          time: "12:00 PM",
          label: "Wedding Lunch\n(អាហារថ្ងៃត្រង់)",
          isRight: false,
          visible: true,
          index: 5,
        ),
        _event(
          icon: Asset.glasses,
          time: "05:00 PM",
          label: "Dinner Party\n(ពិសាភោជនាហារពេលល្ងាច)",
          isRight: false,
          visible: false,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _rightSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _event(
          icon: Asset.cloth,
          time: "06:30 AM",
          label: "Groom’s Procession\n(ពិធីហែជំនូន)",
          isRight: true,
          visible: true,
          index: 0,
        ),
        _event(
          icon: Asset.ring,
          time: "08:15 AM",
          label: "Ring Exchange\n& Honoring the Parents\n(ពិធីបំពាក់ចិញ្ចៀន និងកាត់ខាន់ស្លា)",
          isRight: true,
          visible: false,
        ),
        _event(
          icon: Asset.monk,
          time: "09:02 AM",
          label: "Monks’ Blessing\n(ពិធីសូត្រមន្ត)",
          isRight: true,
          visible: true,
          index: 2,
        ),
        _event(
          icon: Asset.siccor,
          time: "09:35 AM",
          label: "Hair Cutting\n(ពិធីកាត់សក់)",
          isRight: true,
          visible: false,
        ),
        _event(
          icon: Asset.heart,
          time: "10:32 AM",
          label: "Knot Tying\n(ពិធីសំពះផ្ទឹម)",
          isRight: true,
          visible: true,
          index: 4,
        ),
        _event(
          icon: Asset.fork,
          time: "12:00 PM",
          label: "Wedding Lunch\n(អាហារថ្ងៃត្រង់)",
          isRight: true,
          visible: false,
        ),
        _event(
          icon: Asset.glasses,
          time: "05:00 PM",
          label: "Dinner Party\n(ពិសាភោជនាហារពេលល្ងាច)",
          isRight: true,
          visible: true,
          index: 6,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _event({
    required String icon,
    required String time,
    required String label,
    required bool isRight,
    required bool visible,
    int? index,
  }) {
    final size = 45.0;
    final widget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isRight) Image.network(icon, height: size, width: size),
        if (isRight) SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment:
                isRight ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  time,
                  style: baseTextStyle.copyWith(
                      fontWeight: FontWeight.bold, color: mainColor),
                ),
              ),
              Flexible(
                child: Text(
                  label,
                  style: baseTextStyle.copyWith(fontWeight: FontWeight.w600),
                  textAlign: isRight ? TextAlign.start : TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        if (!isRight) SizedBox(width: 8),
        if (!isRight) Image.network(icon, height: size, width: size),
      ],
    );
    final child = Visibility(
      visible: visible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isRight)
              SizedBox(
                width: 20,
                child: Divider(
                  color: mainColor,
                  thickness: 2,
                ),
              ),
            if (isRight && index != null)
              Flexible(child: FadeInRight(delay: delay(index),animate: animate[index], child: widget)),
            if (!isRight && index != null)
              Flexible(child: FadeInLeft(delay: delay(index),animate: animate[index], child: widget)),
            if (index == null) Flexible(child: widget),
            if (!isRight)
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
    if (index != null) {
      return _animateWidget(index: index, child: child);
    }
    return child;
  }

  Widget _animateWidget({required int index, required Widget child}) {
    return VisibilityDetector(
        key: Key('event_$index'),
        onVisibilityChanged: (info) {
          if(context.mounted) {
            setState(() {
              animate[index] = true;
            });
          }
        },
        child: child);
  }
}
