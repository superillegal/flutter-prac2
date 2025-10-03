import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('О приложении', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Text(
              'Название: RKMP3 Demo\nВерсия: 1.0.0\nТехнологии: Flutter, Dart',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Приложение разработано в рамках практической работы №3 для демонстрации '
                  'базовых виджетов, Stateless/Stateful и смены контента.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
