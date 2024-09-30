import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sovann_and_ly/debug_box.dart';
import 'package:url_launcher/url_launcher_string.dart';

final verticalPhotos =
    List.generate(10, (index) => "https://picsum.photos/40$index/60$index");

final horizontalPhotos =
    List.generate(10, (index) => "https://picsum.photos/60$index/40$index");

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          _topPhotoSection(context),
          _aboutCoupleSection(context),
          _date(context),
          _countDown(context),
          Photo(
            src: horizontalPhotos[1],
            width: 1.sw,
          ),
          Photo(src: verticalPhotos[2]),
          Photo(src: verticalPhotos[3]),
          Photo(src: verticalPhotos[4]),
          Photo(src: verticalPhotos[5]),
        ],
      ),
    ));
  }

  Widget _topPhotoSection(BuildContext context) {
    final color = Colors.white;
    final textStyle = GoogleFonts.dancingScript().copyWith(
      fontSize: 18.sp,
      color: color,
    );
    final label = Column(
      children: [
        Text(
          "The Wedding of",
          style: textStyle,
        ),
        Text(
          "Pory Sovann & Heng Sreyly",
          style: textStyle.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("11th January, 2025", style: textStyle),
      ],
    );
    return Stack(
      // alignment: Alignment.bottomCenter,
      children: [
        Photo(
          src: verticalPhotos[0],
          width: 1.sw,
          height: 1.sh,
        ),
        Positioned(bottom: 40.h, left: 0, right: 0, child: label),
      ],
    );
  }

  Widget _aboutCoupleSection(BuildContext context) {
    Widget _info(String name, String father, String mother) {
      final textStyle = GoogleFonts.dancingScript().copyWith(
        fontSize: 45.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: textStyle,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Mr. $father",
            style: GoogleFonts.satisfy()
                .copyWith(fontSize: 20.sp, fontWeight: FontWeight.normal),
          ),
          Text(
            "& Mrs. $mother",
            style: GoogleFonts.satisfy()
                .copyWith(fontSize: 20.sp, fontWeight: FontWeight.normal),
          ),
        ],
      );
    }

    return Column(
      children: [
        _info("Pory Sovann", "Tan Pory", "Meas Sophal"),
        // SizedBox(height: 30.h,),
        Text("&",
            style: GoogleFonts.qwitcherGrypen().copyWith(fontSize: 80.sp)),
        _info("Heng Sreyly", "Koy Porheng", "Em Vouchhour"),
      ],
    );
  }

  Widget _date(BuildContext context) {
    final mapUrl = "https://maps.app.goo.gl/hLxmfccaN5huop8GA";

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black)),
            ),
            child: Text("Saturday, 11 January 2025"),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              children: [
                Icon(
                  Symbols.calendar_add_on,
                  size: 40.r,
                ),
                SizedBox(height: 16.h),
                Text(
                  "Wedding Reception",
                  style: TextStyle().copyWith(fontSize: 20.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Vimean Pi Phup Thmey Sen Sok Wedding Center (Building A)",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                FilledButton(
                  onPressed: () {
                    launchUrlString(mapUrl,
                        mode: LaunchMode.externalApplication);
                  },
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Symbols.location_pin),
                      SizedBox(width: 8.w),
                      Text("View Location"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _countDown(BuildContext context) {
    final marriedDate = DateTime(2025, 1, 11, 23, 59);
    final today = DateTime.now();
    // return CountUpTimer(startDateTime: marriedDate);
    if (today.isAfter(marriedDate)) {
      return CountUpTimer(startDateTime: marriedDate);
    } else {
      return CountdownTimer(targetDateTime: marriedDate);
    }
  }
}

class Photo extends StatelessWidget {
  const Photo({
    super.key,
    required this.src,
    this.width,
    this.height,
  });

  final String src;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      fit: BoxFit.cover,
      width: width,
      height: height,
      cacheHeight: height?.toInt(),
      cacheWidth: width?.toInt(),
    );
  }
}

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
      final style = TextStyle(fontSize: 16.sp);
      return Column(
        children: [
          Text(
            value.toString(),
            style: style.copyWith(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: style,
          ),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Count Down to our Big Day",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
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
        FilledButton(
          onPressed: () {
            launchUrlString(calenderUrl,
                mode: LaunchMode.externalApplication);
          },
          style: ButtonStyle(
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Symbols.calendar_add_on),
              SizedBox(width: 8.w),
              Text("Save the Date"),
            ],
          ),
        ),
      ],
    );
  }
}

class CountUpTimer extends StatefulWidget {
  final DateTime startDateTime;

  CountUpTimer({required this.startDateTime});

  @override
  _CountUpTimerState createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer> {
  late Timer _timer;
  Duration _elapsedTime = Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _elapsedTime = DateTime.now().difference(widget.startDateTime);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime = DateTime.now().difference(widget.startDateTime);
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
    final days = _elapsedTime.inDays;
    final hours = _elapsedTime.inHours % 24;
    final minutes = _elapsedTime.inMinutes % 60;
    final seconds = _elapsedTime.inSeconds % 60;

    Widget _field(String label, int value) {
      final style = TextStyle(fontSize: 16.sp);
      return Column(
        children: [
          Text(
            value.toString(),
            style: style.copyWith(fontSize: 24.sp),
          ),
          Text(
            label,
            style: style,
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _field("Days", days),
        _field("Hours", hours),
        _field("Min", minutes),
        _field("Sec", seconds),
      ],
    );
  }
}
