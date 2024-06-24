// flutter
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// plugins
import 'package:flutter_riverpod/flutter_riverpod.dart';

// youtube_clone widgets
import 'view/phone/nav_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'YouTube Clone',
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            // Fondo negro
            Positioned.fill(
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withOpacity(0)),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
                child: const NavScreen(),
              ),
            ),
          ],
        )
    );
  }
}
