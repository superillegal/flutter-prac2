import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/menu_item_form.dart';

class SeparatedScreen extends StatefulWidget {
  const SeparatedScreen({super.key});

  @override
  State<SeparatedScreen> createState() => _SeparatedScreenState();
}

class _SeparatedScreenState extends State<SeparatedScreen> {
  final List<MenuItem> _items = [
    MenuItem.create(title: 'Бургер грибной', price: 259, category: 'Бургеры'),
    MenuItem.create(title: 'Стрипсы', price: 149, category: 'Закуски'),
    MenuItem.create(title: 'Чай холодный', price: 95, category: 'Напитки'),
    MenuItem.create(title: 'Соус барбекю', price: 39, category: 'Соусы'),
  ];

  void _addItem() {
    showAddMenuItemDialog(context, onAdded: (item) {
      setState(() => _items.add(item));
    });
  }

  void _removeById(int id) {
    setState(() => _items.removeWhere((e) => e.id == id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addItem,
        icon: const Icon(Icons.add),
        label: const Text('Добавить'),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: _items.length,
          separatorBuilder: (ctx, i) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final item = _items[i];
            return MenuItemCard(
              key: ValueKey(item.id),
              item: item,
              onDelete: () => _removeById(item.id),
            );
          },
        ),
      ),
    );
  }
}
