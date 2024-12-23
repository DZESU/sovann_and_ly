import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sovann_and_ly/app.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PhotoSection extends ConsumerStatefulWidget {
  const PhotoSection({super.key});

  @override
  ConsumerState<PhotoSection> createState() => _PhotoSectionState();
}

class _PhotoSectionState extends ConsumerState<PhotoSection> {
  List<String> get images => ref.watch(imagesProvider).photosSectionUrl;

  delay(int index) => Duration(milliseconds: 0);

  final animate = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _animateWidget(
            index: 0,
            child: FadeInUp(animate: animate[0], child: _bigImage(context, 0))),
        Row(
          children: [
            Expanded(
                child: _animateWidget(
                    index: 1,
                    child: FadeInLeftBig(
                        duration: Duration(milliseconds: 800),
                        animate: animate[1],
                        curve: Curves.easeIn,
                        child: _smallImage(context, 1)))),
            Expanded(
                child: _animateWidget(
                    index: 2,
                    child: FadeInRightBig(
                        duration: Duration(milliseconds: 800),
                        animate: animate[2],
                        curve: Curves.easeIn,
                        child: _smallImage(context, 2)))),
          ],
        ),
        _animateWidget(
            index: 3,
            child: FadeInUpBig(
                duration: Duration(milliseconds: 800),
                animate: animate[3],
                child: _bigImage(context, 3))),
        _animateWidget(
            index: 4,
            child: ZoomIn(
                animate: animate[4],
                curve: Curves.easeIn,
                child: _bigImage(context, 4))),
        _animateWidget(
            index: 5,
            child: FadeInUp(animate: animate[5], child: _bigImage(context, 5))),
      ],
    );
  }

  Widget _animateWidget({required int index, required Widget child}) {
    return VisibilityDetector(
        key: Key('photo_$index'),
        onVisibilityChanged: (info) {
          if(context.mounted) {
            setState(() {
              animate[index] = true;
            });
          }
        },
        child: child);
  }

  Widget _bigImage(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => _viewPhoto(context, index),
        child: Hero(tag: index, child: Image.network(images[index])));
  }

  Widget _smallImage(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => _viewPhoto(context, index),
        child: Hero(tag: index, child: Image.network(images[index])));
  }

  void _viewPhoto(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => PhotoViewer(
        images: images,
        initialIndex: index,
      ),
    );
  }
}

class PhotoViewer extends StatefulWidget {
  const PhotoViewer({super.key, required this.images, this.initialIndex = 0});

  final List<String> images;
  final int initialIndex;

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("dismiss"),
      direction: DismissDirection.down,
      onDismissed: (_) {
        Navigator.pop(context);
      },
      child: Stack(
        children: [
          PhotoViewGallery.builder(
            pageController: pageController,
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(widget.images[index]),
                heroAttributes:
                    PhotoViewHeroAttributes(tag: widget.images[index]),
              );
            },
            itemCount: widget.images.length,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                icon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
