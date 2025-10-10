import 'package:flutter/material.dart';
import '../models/menu_item.dart';

Future<void> showAddMenuItemDialog(
    BuildContext context, {
      required void Function(MenuItem) onAdded,
    }) async {
  final formKey = GlobalKey<FormState>();
  final titleCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final categoryCtrl = TextEditingController(text: 'Бургеры');

  await showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: const Text('Добавить позицию меню'),
        content: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Название блюда',
                  ),
                  validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Укажите название' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: priceCtrl,
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Цена, ₽',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Укажите цену';
                    final parsed = double.tryParse(v.replaceAll(',', '.'));
                    if (parsed == null || parsed < 0) return 'Некорректная цена';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: categoryCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Категория',
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              final price =
              double.parse(priceCtrl.text.replaceAll(',', '.'));
              final item = MenuItem.create(
                title: titleCtrl.text,
                price: price,
                category: categoryCtrl.text,
              );
              onAdded(item);
              Navigator.of(ctx).pop();
            },
            child: const Text('Добавить'),
          ),
        ],
      );
    },
  );
}
