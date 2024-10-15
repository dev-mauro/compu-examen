class Category {

  final int id;
  final String name;
  final bool isActive;

  Category({
    required this.id,
    required this.name,
    this.isActive = true,
  });

}