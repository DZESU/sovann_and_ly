import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CountdownTimer extends StatefulWidget {
  final DateTime targetDateTime;

  CountdownTimer({required this.targetDateTime});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _remainingTime = Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = widget.targetDateTime.difference(DateTime.now());

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        if (widget.targetDateTime.isBefore(now)) {
          _timer.cancel(); // Stops the timer when the countdown is over
          _remainingTime = Duration();
        } else {
          _remainingTime = widget.targetDateTime.difference(now);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;
    final seconds = _remainingTime.inSeconds % 60;
    final calenderUrl = "https://calendar.app.google/JPAdt5ugE6W4Hepc6";

    Widget _field(String label, int value) {
      final style = baseTextStyle.copyWith(fontSize: 16.sp);
      final labelStyle = GoogleFonts.bonheurRoyale(fontSize: 16.sp);
      return Column(
        children: [
          Text(
            value.toString(),
            style: style.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: labelStyle,
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Our Wedding",
          style: titleTextStyle,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _field("Days", days),
            _field("Hours", hours),
            _field("Min", minutes),
            _field("Sec", seconds),
          ],
        ),
        SizedBox(height: 16.h),
        TextButton(
          onPressed: () {
            launchUrlString(calenderUrl, mode: LaunchMode.externalApplication);
          },
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              side: WidgetStatePropertyAll(BorderSide(color: mainColor))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Save the Date", style: baseTextStyle.copyWith(color: mainColor),),
              SizedBox(width: 8.w),
              Icon(Symbols.calendar_add_on, color: mainColor, size: 22,),
            ],
          ),
        ),
      ],
    );
  }
}