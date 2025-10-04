import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const projects = <_GalleryItem>[
      _GalleryItem(
        title: 'Прототип профиля',
        description: 'Карточка студента с ключевыми навыками.',
        icon: Icons.person_pin_circle_outlined,
      ),
      _GalleryItem(
        title: 'Экран настроек',
        description: 'Интерактивные тумблеры и слайдер громкости.',
        icon: Icons.tune,
      ),
      _GalleryItem(
        title: 'Галерея работ',
        description: 'Сетка карточек с аннотациями проектов.',
        icon: Icons.grid_view,
      ),
      _GalleryItem(
        title: 'Навигация',
        description: 'Материальная панель с пятью разделами.',
        icon: Icons.navigation_outlined,
      ),
      _GalleryItem(
        title: 'Карточка команды',
        description: 'Данные из профиля используются в подписи.',
        icon: Icons.group_outlined,
      ),
      _GalleryItem(
        title: 'Справка',
        description: 'История и планы развития приложения.',
        icon: Icons.menu_book_outlined,
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Галерея проектов',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Карточки показывают, как данные из профиля и настроек выглядят в разных сценариях.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: projects.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final item = projects[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item.icon, size: 40),
                          const SizedBox(height: 12),
                          Text(
                            item.title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.description,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Добавлено успешно')),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Добавить проект'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryItem {
  final String title;
  final String description;
  final IconData icon;

  const _GalleryItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}
