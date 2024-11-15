import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sovann_and_ly/app.dart';
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

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, this.name});

  final String? name;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(imagesProvider);
    final body = viewModel.isImagesLoaded ? _body(context) : _loading(context);
    // final body = _loading(context);
    return Scaffold(body: body);
  }

  Widget _body(BuildContext context) {
    final silverGap =
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 16));
    return Stack(
      children: [
        Image.asset(
          Asset.mainBg,
          height: 1.sh,
          width: 1.sw,
          fit: BoxFit.fill,
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Introduction(name: widget.name)),
            silverGap,
            SliverToBoxAdapter(child: NameSection()),
            silverGap,
            SliverToBoxAdapter(child: PhotoSection()),
            silverGap,
            SliverToBoxAdapter(child: WeddingDetail()),
            silverGap,
            SliverToBoxAdapter(child: WeddingAgendaV2()),
            silverGap,
            SliverToBoxAdapter(child: VenueSecion()),
            silverGap,
            silverGap,
          ],
        ),
      ],
    );
  }

  Widget _loading(BuildContext context) {
    return Center(child: SvgPulseEffect());
  }
}

class SvgPulseEffect extends StatefulWidget {
  @override
  _SvgPulseEffectState createState() => _SvgPulseEffectState();
}

class _SvgPulseEffectState extends State<SvgPulseEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: mainColor,
      end: Color(0xFFE286A6),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return SvgPicture.asset(
          Asset.loading,
          colorFilter: ColorFilter.mode(_colorAnimation.value!, BlendMode.srcIn),
          width: 150,
        );
      },
    );
  }
}
