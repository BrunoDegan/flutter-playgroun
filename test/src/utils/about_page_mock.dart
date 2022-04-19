import 'package:flutter_playground/src/about_page/domain/model/about_model.dart';
import 'package:flutter_playground/src/about_page/domain/model/favorites_model.dart';
import 'package:flutter_playground/src/about_page/domain/model/skill_model.dart';

final modelMock = AboutModel(
  userImagePath: 'assets/flutterando_screen/profile_image.jpeg',
  userName: 'Bruno Degan',
  description:
      'Duis rhoncus dui venenatis consequat porttitor. Etiam aliquet congue consequat. In posuere, nunc sit amet laoreet blandit, urna sapien.',
  skills: [
    const SkillsModel(title: 'Flutter', percentage: 62),
    const SkillsModel(title: 'Android', percentage: 100),
    const SkillsModel(title: 'Kotlin', percentage: 92),
    const SkillsModel(title: 'Python', percentage: 58),
    const SkillsModel(title: 'Machine learning', percentage: 34),
    const SkillsModel(title: 'Data Science', percentage: 34),
    const SkillsModel(title: 'C/C++', percentage: 17),
  ],
  favorites: [
    const FavoritesModel(
        title: 'Flutter', imagePath: 'assets/flutterando_screen/flutter.png'),
    const FavoritesModel(
        title: 'Python', imagePath: 'assets/flutterando_screen/python.png'),
    const FavoritesModel(
        title: 'Java', imagePath: 'assets/flutterando_screen/java.png'),
    const FavoritesModel(
        title: 'Python', imagePath: 'assets/flutterando_screen/python.png'),
    const FavoritesModel(
        title: 'Kotlin', imagePath: 'assets/flutterando_screen/kotlin.png')
  ],
);

const jsonResponse = {
  'about': {
    'userImagePath': 'assets/flutterando_screen/profile_image.jpeg',
    'userName': 'Bruno Degan',
    'description':
        'Duis rhoncus dui venenatis consequat porttitor. Etiam aliquet congue consequat. In posuere, nunc sit amet laoreet blandit, urna sapien.',
    'skills': [
      {'title': 'Flutter', 'percentage': 62},
      {'title': 'Android', 'percentage': 100},
      {'title': 'Dart', 'percentage': 50},
      {'title': 'Kotlin', 'percentage': 92},
      {'title': 'Python', 'percentage': 58},
      {'title': 'Machine Learning', 'percentage': 34},
      {'title': 'Data Science', 'percentage': 34},
      {'title': 'C/C++', 'percentage': 17}
    ],
    'favorites': [
      {
        'title': 'Flutter',
        'imagePath': 'assets/flutterando_screen/flutter.png'
      },
      {'title': 'Python', 'imagePath': 'assets/flutterando_screen/python.png'},
      {'title': 'Kotlin', 'imagePath': 'assets/flutterando_screen/kotlin.png'},
      {'title': 'Java', 'imagePath': 'assets/flutterando_screen/java.png'},
      {
        'title': 'Flutter',
        'imagePath': 'assets/flutterando_screen/flutter.png'
      },
      {'title': 'Python', 'imagePath': 'assets/flutterando_screen/python.png'},
      {'title': 'Kotlin', 'imagePath': 'assets/flutterando_screen/kotlin.png'}
    ]
  }
};
