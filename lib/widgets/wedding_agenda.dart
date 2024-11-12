import 'package:flutter/material.dart';
import 'package:sovann_and_ly/app.dart';

class WeddingAgenda extends StatelessWidget {
  const WeddingAgenda({super.key});

  final decorColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Wedding Agenda",
          style: baseTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 24),
        Text(
          "Morning Session",
          style: baseTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        _circle(),
        _line(),
        _event("6:30 AM", "Guest arrival at bride's residence at Vimean Piphup Thmey Building A"),
        _line(),
        _event("7:00 - 11:00 AM", "Khmer Ceremony"),
        _line(),
        _event("12:00 PM", "Lunch is served at bride's residence"),
        Text(
          "Evening Session",
          style: baseTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        _circle(),
        _line(),
        _event("5:30 PM", "Reception held at Vimean Piphup Thmey Building A"),
      ],
    );
  }

  Widget _event(String time, String des) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            textAlign: TextAlign.center,
            style: baseTextStyle.copyWith(fontSize: 18),
          ),
          Text(
            des,
            textAlign: TextAlign.center,
            style: baseTextStyle.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _circle() {
    final size = 25.0;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: decorColor, width: 3)),
    );
  }

  Widget _line({double height = 25}) {
    return Container(
      height: height,
      width: 1,
      decoration: BoxDecoration(
        border: Border.all(color: decorColor, width: 2),
      ),
    );
  }
}
