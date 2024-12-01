import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:recase/recase.dart';
import 'package:sovann_and_ly/asset.dart';

import 'home_page.dart';

final baseTextStyle = GoogleFonts.cormorantGaramond(color: Color(0xFF954840));
// final titleTextStyle =
//     TextStyle(fontFamily: 'Batusa', fontSize: 36, color: Color(0xFF954840));
final titleTextStyle = GoogleFonts.parisienne().copyWith(
    fontSize: 40, color: Color(0xFF954840), fontWeight: FontWeight.w600);
final nameTextStyle = TextStyle(
  fontFamily: "HelloGraduationScript-PKR3P",
  fontWeight: FontWeight.w600,
  color: Color(0xFF954840),
);
// final mainColor = Colors.green;
final mainColor = Color(0xFFBB0083);

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
    return KeyboardDismisser(
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp.router(
            theme: ThemeData.light().copyWith(
                primaryColor: mainColor,
                indicatorColor: mainColor,
                primaryColorLight: mainColor),
            debugShowCheckedModeBanner: false,
            routerConfig: _router,
          );
        },
      ),
    );
  }
}

final imagesProvider = ChangeNotifierProvider<ImageViewModel>((ref) {
  return ImageViewModel();
});

class ImageViewModel extends ChangeNotifier {
  final _urls = [];

  final _photosSectionUrl = [
    "https://raw.githubusercontent.com/DZESU/sovann_and_ly/refs/heads/main/assets/images/0.jpg",
    "https://raw.githubusercontent.com/DZESU/sovann_and_ly/refs/heads/main/assets/images/1.jpg",
    "https://raw.githubusercontent.com/DZESU/sovann_and_ly/refs/heads/main/assets/images/2.jpg",
    "https://raw.githubusercontent.com/DZESU/sovann_and_ly/refs/heads/main/assets/images/3.jpg",
    "https://raw.githubusercontent.com/DZESU/sovann_and_ly/refs/heads/main/assets/images/4.jpg",
    "https://raw.githubusercontent.com/DZESU/sovann_and_ly/refs/heads/main/assets/images/5.jpg",
  ];

  final introSectionUrl = [
    Asset.weedLeft,
    Asset.weedRight,
    Asset.sakura3,
    Asset.sakura1,
    Asset.nameInitial,
    Asset.introductionMain,
  ];

  final agendaSectionUrl = [
    Asset.cloth,
    Asset.ring,
    Asset.monk,
    Asset.siccor,
    Asset.heart,
    Asset.fork,
    Asset.glasses,
  ];

  final weddingDetailSection = [
    Asset.sakura,
    Asset.initialName,
    Asset.map,
  ];

  ImageViewModel() {
    _urls.addAll(_photosSectionUrl);
    _urls.addAll(introSectionUrl);
    _urls.addAll(agendaSectionUrl);
  }

  List<String> get photosSectionUrl => _photosSectionUrl;

  // Map<String, List> _images = {};
  Completer<void> _imagesLoadedCompleter = Completer();

  bool get isImagesLoaded {
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
          name: state.uri.queryParameters["name"]?.titleCase,
        );
      },
    ),
  ],
);
