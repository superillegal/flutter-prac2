import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const RKMP3App());
}

class RKMP3App extends StatelessWidget {
  const RKMP3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RKMP3 Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
