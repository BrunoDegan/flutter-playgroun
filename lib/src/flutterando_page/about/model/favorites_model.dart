class FavoritesModel {
  final String title;
  final String imagePath;

  FavoritesModel({required this.title, required this.imagePath});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      title: json['title'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() => {'title': title, 'imagePath': imagePath};
}
