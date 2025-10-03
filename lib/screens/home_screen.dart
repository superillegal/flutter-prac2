import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'gallery_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  late final List<Widget> _pages = const [
    _HomeTab(),
    ProfileScreen(),
    SettingsScreen(),
    GalleryScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Учебный портал RKMP3')),
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), label: 'Главная'),
          NavigationDestination(
              icon: Icon(Icons.person_outline), label: 'Профиль'),
          NavigationDestination(
              icon: Icon(Icons.settings_outlined), label: 'Настройки'),
          NavigationDestination(
              icon: Icon(Icons.photo_library_outlined), label: 'Галерея'),
          NavigationDestination(
              icon: Icon(Icons.info_outline), label: 'О проекте'),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Добро пожаловать в RKMP3',
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            'Рогах Р.В. ИКБО-12-22',
            style: theme.textTheme.labelLarge
                ?.copyWith(color: colorScheme.primary),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: colorScheme.primaryContainer,
            ),
            child: const Text(
              'Приложение собирает ключевые разделы учебного проекта: личный профиль, '
              'настройки взаимодействия, галерею реализованных решений и описание концепции. '
              'Используйте нижнюю панель, чтобы быстро переходить между экранами.',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Основные разделы',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          const _FeatureCard(
            icon: Icons.person_outline,
            title: 'Профиль участника',
            description:
                'Актуальные контакты, учебные интересы и опыт работы над проектами.',
          ),
          const SizedBox(height: 8),
          const _FeatureCard(
            icon: Icons.settings_outlined,
            title: 'Настройки',
            description:
                'Выбирайте режимы работы приложения и управляйте уведомлениями.',
          ),
          const SizedBox(height: 8),
          const _FeatureCard(
            icon: Icons.photo_library_outlined,
            title: 'Галерея проектов',
            description:
                'Подборка ключевых экранов и решений, созданных в рамках курса.',
          ),
          const SizedBox(height: 8),
          const _FeatureCard(
            icon: Icons.info_outline,
            title: 'О проекте',
            description:
                'История разработки, стек технологий и планы по развитию.',
          ),
          const SizedBox(height: 24),
          Row(
            children: const [
              Expanded(child: _InfoCard(title: 'Активных экранов', value: '5')),
              SizedBox(width: 12),
              Expanded(child: _InfoCard(title: 'Фокус', value: 'UI/UX')),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Совет: начните с профиля, чтобы заполнить данные, затем переходите в настройки и галерею — '
            'они используют эти сведения для персонализации отображения.',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 6),
          Text(value,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
