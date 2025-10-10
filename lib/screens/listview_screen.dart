import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/menu_item_form.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  final List<MenuItem> _items = [
    MenuItem.create(title: 'Бургер BBQ', price: 249, category: 'Бургеры'),
    MenuItem.create(title: 'Наггетсы', price: 139, category: 'Закуски'),
    MenuItem.create(title: 'Кола 0.5', price: 110, category: 'Напитки'),
    MenuItem.create(title: 'Соус сырный', price: 39, category: 'Соусы'),
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
        title: const Text('ListView.builder'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addItem,
        icon: const Icon(Icons.add),
        label: const Text('Добавить'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _items.length,
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
