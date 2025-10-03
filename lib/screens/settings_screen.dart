import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkPreview = false;

  @override
  Widget build(BuildContext context) {
    final previewColor = darkPreview
        ? Theme.of(context).colorScheme.inverseSurface
        : Theme.of(context).colorScheme.primaryContainer;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Настройки', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          SwitchListTile(
            title: const Text('Уведомления'),
            value: notifications,
            onChanged: (v) => setState(() => notifications = v),
          ),
          SwitchListTile(
            title: const Text('Предпросмотр тёмной темы'),
            value: darkPreview,
            onChanged: (v) => setState(() => darkPreview = v),
          ),
          const SizedBox(height: 12),
          Container(
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: previewColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('Зона предпросмотра темы'),
          ),
        ],
      ),
    );
  }
}
