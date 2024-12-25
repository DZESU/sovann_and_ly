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
  fontFamily: "HapshaSophiaScript-e91Yl",
  // fontWeight: FontWeight.w600,
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
    "https://cloud.appwrite.io/v1/storage/buckets/67695f0b000e080472d9/files/6769765600017892bc1e/view?project=674b3cc10020b36635dc",
    "https://cloud.appwrite.io/v1/storage/buckets/67695f0b000e080472d9/files/67695fc7003783496283/view?project=674b3cc10020b36635dc",
    "https://cloud.appwrite.io/v1/storage/buckets/67695f0b000e080472d9/files/67695fb4001a88b1f2fc/view?project=674b3cc10020b36635dc",
    "https://cloud.appwrite.io/v1/storage/buckets/67695f0b000e080472d9/files/6769765e000ad731472b/view?project=674b3cc10020b36635dc",
    "https://cloud.appwrite.io/v1/storage/buckets/67695f0b000e080472d9/files/67697667001c9d98e4da/view?project=674b3cc10020b36635dc",
    "https://cloud.appwrite.io/v1/storage/buckets/67695f0b000e080472d9/files/67695feb001cc9378d77/view?project=674b3cc10020b36635dc",
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
        String? username= state.uri.queryParameters["name"];
        username = username?.replaceAll(" and ", " & ");
        username = capitalizeEachWord(username);
        return HomePage(
          name: username,
        );
      },
    ),
  ],
);

String? capitalizeEachWord(String? input) {
  if (input == null) return null;
  if (input.isEmpty) return input;

  return input
      .split(' ') // Split the string into words based on spaces
      .map((word) => word.isEmpty
          ? word
          : word[0].toUpperCase() +
              word
                  .substring(1)
                  .toLowerCase()) // Capitalize first letter and lowercase the rest
      .join(' '); // Join the words back into a single string
}
