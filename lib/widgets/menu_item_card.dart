import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onDelete;

  const MenuItemCard({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(item.id),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(item.title),
        subtitle: Text('${item.category} • ${item.price.toStringAsFixed(2)} ₽'),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
          tooltip: 'Удалить',
        ),
        onLongPress: onDelete,
      ),
    );
  }
}
