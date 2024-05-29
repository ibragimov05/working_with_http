class CategoryY {
  final int id;
  final String name;
  final String image;
  final String creationAt;
  final String updatedAt;

  CategoryY({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory CategoryY.fromJson(Map<String, dynamic> json) {
    return CategoryY(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
