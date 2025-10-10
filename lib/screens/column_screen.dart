import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/menu_item_form.dart';

class ColumnScreen extends StatefulWidget {
  const ColumnScreen({super.key});

  @override
  State<ColumnScreen> createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  final List<MenuItem> _items = [
    MenuItem.create(title: 'Чизбургер', price: 189, category: 'Бургеры'),
    MenuItem.create(title: 'Картофель фри', price: 99, category: 'Гарниры'),
    MenuItem.create(title: 'Лимонад', price: 120, category: 'Напитки'),
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
        title: const Text('Column + Scroll'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addItem,
        icon: const Icon(Icons.add),
        label: const Text('Добавить'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 88),
          child: Column(
            children: [
              const SizedBox(height: 8),
              for (final item in _items)
                MenuItemCard(
                  item: item,
                  onDelete: () => _removeById(item.id),
                ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Всего позиций: ${_items.length}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
