import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int experienceYears = 1;

  String get _experienceSuffix {
    final value = experienceYears;
    final mod10 = value % 10;
    final mod100 = value % 100;
    if (mod10 == 1 && mod100 != 11) return ' год';
    if (mod10 >= 2 && mod10 <= 4 && (mod100 < 10 || mod100 >= 20)) return ' года';
    return ' лет';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Профиль участника',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('Рогах Роман'),
              subtitle: Text('Студент группы ИКБО-12-22'),
              trailing: Icon(Icons.badge_outlined),
            ),
          ),

          const SizedBox(height: 12),
          Text('Навыки и интересы', style: theme.textTheme.labelLarge),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text('Flutter')),
              Chip(label: Text('UI/UX')),
              Chip(label: Text('Clean Architecture')),
              Chip(label: Text('Учебные проекты')),
            ],
          ),

          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.secondaryContainer,
            ),
            child: Text('Опыт участия в проектах: $experienceYears$_experienceSuffix'),
          ),

          const SizedBox(height: 12),

          ElevatedButton(
            onPressed: () => setState(() => experienceYears++),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.trending_up),
                SizedBox(width: 8),
                Text('Добавить год опыта'),
              ],
            ),
          ),

          const SizedBox(height: 12),


          PrimaryButton(
            text: 'Показать контактные данные',
            icon: Icons.mail_outline,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Email: roman.rogakh@example.com')),
              );
            },
          ),

          const SizedBox(height: 16),
          Text(
            'Заполненный профиль помогает в разделе "Галерея" — карточки проектов используют имя и навыки '
            'для подписей, а настройки подстраивают уведомления под выбранные интересы.',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
