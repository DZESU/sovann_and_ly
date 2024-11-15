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

  delay(int index) => Duration(milliseconds: 00 + (50 * index));

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
                        animate: animate[1],
                        curve: Curves.easeIn,
                        child: _smallImage(context, 3)))),
            Expanded(
                child: _animateWidget(
                    index: 2,
                    child: FadeInRightBig(
                        animate: animate[2],
                        curve: Curves.easeIn,
                        child: _smallImage(context, 2)))),
          ],
        ),
        _animateWidget(
            index: 3,
            child:
                FadeInUpBig(animate: animate[3], child: _bigImage(context, 1))),
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
          setState(() {
            animate[index] = true;
          });
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

// enum AnimateDirection { left, right, top, bottom }
//
// class VisibleWidget extends StatefulWidget {
//   const VisibleWidget(
//       {super.key,
//       required this.child,
//       required this.name,
//       required this.onVisiable});
//
//   final Widget child;
//   final String name;
//   final ValueChanged<bool> onVisiable;
//
//   @override
//   State<VisibleWidget> createState() => _VisibleWidgetState();
// }
//
// class _VisibleWidgetState extends State<VisibleWidget> {
//   bool _animate = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//         key: Key(widget.name),
//         child: widget.child,
//         onVisibilityChanged: (info) {
//           widget.onVisiable.call(true);
//         });
//   }
// }

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({super.key, required this.images, this.initialIndex = 0});

  final List<String> images;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhotoViewGallery.builder(
          pageController: PageController(initialPage: initialIndex),
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(images[index]),
              heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
            );
          },
          itemCount: images.length,
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
    );
  }
}
