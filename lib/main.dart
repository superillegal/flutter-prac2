import 'package:flutter/material.dart';
import 'screens/column_screen.dart';
import 'screens/listview_screen.dart';
import 'screens/separated_screen.dart';

void main() {
  runApp(const RKMP4());
}

class RKMP4 extends StatefulWidget {
  const RKMP4({super.key});

  @override
  State<RKMP4> createState() => _RKMP4State();
}

class _RKMP4State extends State<RKMP4> {
  int _current = 0;

  final _pages = const [
    ColumnScreen(),
    ListViewScreen(),
    SeparatedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практическая №4 — Списки',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF0D47A1),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _current,
          children: _pages,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _current,
          onDestinationSelected: (i) => setState(() => _current = i),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.view_column),
              label: 'Column',
            ),
            NavigationDestination(
              icon: Icon(Icons.list),
              label: 'ListView',
            ),
            NavigationDestination(
              icon: Icon(Icons.view_list),
              label: 'Separated',
            ),
          ],
        ),
      ),
    );
  }
}
