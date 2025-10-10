class MenuItem {
  final int id;
  final String title;
  final double price;
  final String category;

  MenuItem({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
  });

  static int _counter = 0;

  factory MenuItem.create({
    required String title,
    required double price,
    required String category,
  }) {
    _counter++;
    return MenuItem(
      id: _counter,
      title: title.trim(),
      price: price,
      category: category.trim().isEmpty ? 'Прочее' : category.trim(),
    );
  }
}
