import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

final baseTextStyle = GoogleFonts.cormorantGaramond();
// final mainColor = Colors.green;
final mainColor = Color(0xFFa586a6);

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {

  @override
  void initState() {
    super.initState();
    ref.read(imagesProvider).waitForAllImagesToLoad();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,
        );
      },
    );
  }
}

final imagesProvider = ChangeNotifierProvider<ImageViewModel>((ref) {
  return ImageViewModel();
});

class ImageViewModel extends ChangeNotifier {
  final _urls = [];

  final _photosSectionUrl = [
    "https://raw.githubusercontent.com/DZESU/DZESU.github.io/refs/heads/master/assets/assets/images/0.jpg",
    "https://raw.githubusercontent.com/DZESU/DZESU.github.io/refs/heads/master/assets/assets/images/1.JPG",
    "https://raw.githubusercontent.com/DZESU/DZESU.github.io/refs/heads/master/assets/assets/images/2.jpg",
    "https://raw.githubusercontent.com/DZESU/DZESU.github.io/refs/heads/master/assets/assets/images/3.jpg",
    "https://raw.githubusercontent.com/DZESU/DZESU.github.io/refs/heads/master/assets/assets/images/4.JPG",
    "https://raw.githubusercontent.com/DZESU/DZESU.github.io/refs/heads/master/assets/assets/images/5.JPG",
  ];

  ImageViewModel() {
    _urls.addAll(_photosSectionUrl);
  }

  List<String> get photosSectionUrl => _photosSectionUrl;

  // Map<String, List> _images = {};
  Completer<void> _imagesLoadedCompleter = Completer();

  bool get isImagesLoaded{
    return _imagesLoadedCompleter.isCompleted;
  }

  void waitForAllImagesToLoad() {
    int loadedImages = 0;

    for (String url in _urls) {
      final image = Image.network(url);
      final imageStream = image.image.resolve(const ImageConfiguration());

      imageStream.addListener(
        ImageStreamListener(
          (info, _) {
            loadedImages++;
            if (loadedImages == _urls.length &&
                !_imagesLoadedCompleter.isCompleted) {
              _imagesLoadedCompleter.complete();
              notifyListeners();
            }
          },
          onError: (error, _) {
            loadedImages++;
            debugPrint('Error loading image: $error');
          },
        ),
      );
    }
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        print(state.uri);
        return HomePage(
          name: state.uri.queryParameters["name"],
        );
      },
    ),
  ],
);
