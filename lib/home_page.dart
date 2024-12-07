import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:sovann_and_ly/asset.dart';
import 'package:sovann_and_ly/debug_box.dart';
import 'package:sovann_and_ly/widgets/count_time.dart';
import 'package:sovann_and_ly/widgets/introduction.dart';
import 'package:sovann_and_ly/widgets/message_section.dart';
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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(imagesProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    Widget child;
    if (screenWidth > 500) {
      child = _web(context);
    } else {
      child = _mobile(context);
    }
    final body = viewModel.isImagesLoaded ? child : _loading(context);
    // final body =  _loading(context);

    return Scaffold(
      body: Opacity(opacity: 1, child: body),
    );
  }

  Widget _web(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 4, child: _photoViews(context)),
        Expanded(flex: 2, child: _mobile(context)),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return _mainView(context);
  }

  Widget _mainView(BuildContext context) {
    // return MessageSection(username: "Hello");
    final silverGap =
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 16));
    return Stack(
      children: [
        Image.network(
          Asset.mainBg,
          height: 1.sh,
          width: 1.sw,
          fit: BoxFit.fill,
        ),
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(child: Introduction(name: widget.name)),
            silverGap,
            SliverToBoxAdapter(child: NameSection()),
            silverGap,
            SliverToBoxAdapter(child: PhotoSection()),
            silverGap,
            // SliverToBoxAdapter(child: WeddingDetail()),
            // silverGap,
            // SliverToBoxAdapter(child: WeddingAgendaV2()),
            SliverToBoxAdapter(
              child: Stack(
                alignment: Alignment(0, -.2),
                children: [
                  Positioned(
                      left: -40,
                      child: Opacity(
                          opacity: .3,
                          child: Image.network(
                            Asset.sakura1,
                            height: 350,
                          ))),
                  Column(
                    children: [
                      WeddingDetail(),
                      SizedBox(height: 32),
                      WeddingAgendaV2()
                    ],
                  ),
                ],
              ),
            ),
            silverGap,
            SliverToBoxAdapter(child: VenueSecion()),
            silverGap,
            silverGap,
            SliverToBoxAdapter(
                child: CountdownTimer(
              targetDateTime: DateTime(2025, 01, 11),
            )),
            silverGap,
            // if(widget.name?.isEmpty == true || kDebugMode)
            SliverToBoxAdapter(
                child: MessageSection(
              username: widget.name ?? 'god',
            )),
            silverGap,
            SliverToBoxAdapter(
              child: Center(
                  child: Text(
                "We are waiting to see you at our wedding.\nThank you!",
                textAlign: TextAlign.center,
                style: titleTextStyle.copyWith(fontSize: 25),
              )),
            ),
            silverGap,
          ],
        ),
      ],
    );
  }

  Widget _photoViews(BuildContext context) {
    final viewModel = ref.watch(imagesProvider);

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 1,
        viewportFraction: 1,
        autoPlayAnimationDuration: Duration(seconds: 1),
      ),
      // carouselController: carouselController,
      items: viewModel.photosSectionUrl.map((url) {
        return Image.network(
          url,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }

  Widget _loading(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(Asset.heartLoading,
            width: 200, decoder: LottieComposition.decodeGZip),
        SizedBox(height: 6),
        SvgPulseEffect(),
      ],
    ));
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
          colorFilter:
              ColorFilter.mode(_colorAnimation.value!, BlendMode.srcIn),
          width: 150,
        );
      },
    );
  }
}
