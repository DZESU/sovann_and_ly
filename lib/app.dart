import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

final baseTextStyle = GoogleFonts.cormorantGaramond();
// final mainColor = Colors.green;
final mainColor = Color(0xFFa586a6);

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,
        );
      },
      child: HomePage(),
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
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
