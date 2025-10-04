import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'О проекте',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Приложение: RKMP3 Demo'),
                    SizedBox(height: 4),
                    Text('Версия: 1.0.0'),
                    SizedBox(height: 4),
                    Text('Стек: Flutter, Dart, Material Design 3'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('Как всё связано', style: theme.textTheme.labelLarge),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Профиль'),
                    subtitle: Text(
                        'Источник данных для галереи и краткой подписи на главной.'),
                  ),
                  Divider(height: 0),
                  ListTile(
                    leading: Icon(Icons.settings_outlined),
                    title: Text('Настройки'),
                    subtitle: Text(
                        'Определяют уведомления и режимы отображения на других экранах.'),
                  ),
                  Divider(height: 0),
                  ListTile(
                    leading: Icon(Icons.photo_library_outlined),
                    title: Text('Галерея'),
                    subtitle: Text(
                        'Показывает реализации экранов и ссылки на сценарии использования.'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: theme.colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Проект подготовлен Рогахом Романом (ИКБО-12-22) в рамках учебной работы. '
                  'Цель — показать связку нескольких экранов и работу со стейтом в Flutter.',
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Дополнительную информацию можно найти в профиле: там указаны контакты и компетенции автора.',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}