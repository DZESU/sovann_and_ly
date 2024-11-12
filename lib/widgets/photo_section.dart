import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoSection extends StatelessWidget {
  PhotoSection({super.key});

  final images = List.generate(6, (index) => "assets/images/$index.jpg");

  delay(int index)=>Duration(milliseconds: 00 + (100*index));
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        ZoomIn(delay: delay(0),child: _bigImage(context, 0)),
        Row(
          children: [
            Expanded(child: ZoomIn(delay: delay(1),child: _smallImage(context, 3))),
            Expanded(child: ZoomIn(delay: delay(2),child: _smallImage(context, 2))),
          ],
        ),
        ZoomIn(delay: delay(3),child: _bigImage(context, 1)),
        ZoomIn(delay: delay(4),child: _bigImage(context, 4)),
        ZoomIn(delay: delay(5),child: _bigImage(context, 5)),
      ],
    );
  }

  Widget _bigImage(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => _viewPhoto(context, index),
        child: Hero(tag: index, child: Image.asset(images[index])));
  }

  Widget _smallImage(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => _viewPhoto(context, index),
        child: Hero(tag: index, child: Image.asset(images[index])));
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
              imageProvider: AssetImage(images[index]),
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
