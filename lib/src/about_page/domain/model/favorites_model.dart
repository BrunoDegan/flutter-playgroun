import 'package:equatable/equatable.dart';

class FavoritesModel extends Equatable {
  final String title;
  final String imagePath;

  const FavoritesModel({required this.title, required this.imagePath});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      title: json['title'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() => {'title': title, 'imagePath': imagePath};

  @override
  List<Object> get props => [title, imagePath];

  @override
  bool? get stringify => false;
}
