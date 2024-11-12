
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sovann_and_ly/asset.dart';
import 'package:sovann_and_ly/widgets/introduction.dart';
import 'package:sovann_and_ly/widgets/name_section.dart';
import 'package:sovann_and_ly/widgets/photo_section.dart';
import 'package:sovann_and_ly/widgets/venue_secion.dart';
import 'package:sovann_and_ly/widgets/wedding_agenda_v2.dart';
import 'package:sovann_and_ly/widgets/wedding_detail.dart';

final verticalPhotos =
    List.generate(10, (index) => "https://picsum.photos/40$index/60$index");

final horizontalPhotos =
    List.generate(10, (index) => "https://picsum.photos/60$index/40$index");

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.name});

  final String? name;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          Asset.mainBg,
          height: 1.sh,
          fit: BoxFit.fitHeight,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Introduction(name: widget.name,),
              SizedBox(height: 32),
              NameSection(),
              SizedBox(height: 32),
              PhotoSection(),
              SizedBox(height: 32),
              WeddingDetail(),
              SizedBox(height: 24),
              WeddingAgendaV2(),
              SizedBox(height: 32),
              VenueSecion(),
              SizedBox(height: 0.1.sh),
            ],
          ),
        ),
      ],
    ));
  }
}
