import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkPreview = false;
  double playerVolume = 0.6;
  String syncMode = 'Автоматически';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Настройки',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          SwitchListTile(
            title: const Text('Уведомления о новых заданиях'),
            subtitle: const Text('Получайте напоминания о дедлайнах и обновлениях.'),
            value: notifications,
            onChanged: (v) => setState(() => notifications = v),
          ),

          // ⬇️ Тут была пропущена запятая
          SwitchListTile(
            title: const Text('Предпросмотр тёмной темы'),
            subtitle: const Text('Используется в галерее и разделе профиля для ночного режима.'),
            value: darkPreview,
            onChanged: (v) => setState(() => darkPreview = v),
          ),
          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Громкость медиаплеера'),
                  Slider(
                    value: playerVolume,
                    min: 0,
                    max: 1,
                    divisions: 10,
                    label: '${(playerVolume * 100).round()}%',
                    onChanged: (value) => setState(() => playerVolume = value),
                  ),
                  Text('${(playerVolume * 100).round()}%'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Expanded(child: Text('Синхронизация данных')),
                  DropdownButton<String>(
                    value: syncMode,
                    items: const [
                      DropdownMenuItem(value: 'Автоматически', child: Text('Автоматически')),
                      DropdownMenuItem(value: 'Ручной контроль', child: Text('Ручной контроль')),
                      DropdownMenuItem(value: 'Выключено', child: Text('Выключено')),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => syncMode = value);
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.surfaceVariant,
            ),
            child: const Text(
              'Текущие настройки учитываются в профиле и галерее: уведомления напоминают об обновлении '
                  'фотографий, а выбранный режим синхронизации влияет на состав справки в разделе "О проекте".',
            ),
          ),
        ],
      ),
    );
  }
}
