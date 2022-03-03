import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_about_model.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_favorites_model.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_skill_model.dart';

class AboutPageDataSource {
  AboutPageDataSource();

  FlutterandoAboutModel getAboutData() {
    return FlutterandoAboutModel(
      userImagePath: "assets/flutterando_screen/profile_image.jpeg",
      userName: "Bruno Degan",
      description: """Duis rhoncus dui venenatis consequat porttitor. Etiam 
      aliquet congue consequat. In posuere, nunc sit amet
      laoreet blandit, urna sapien.""",
      skillsList: [
        SkillsModel(title: "Flutter", percentage: 62),
        SkillsModel(title: "Android", percentage: 100),
        SkillsModel(title: "Dart", percentage: 50),
        SkillsModel(title: "Kotlin", percentage: 92),
        SkillsModel(title: "Python", percentage: 58),
        SkillsModel(title: "Machine learning", percentage: 43),
        SkillsModel(title: "Data Science", percentage: 34),
        SkillsModel(title: "C/C++", percentage: 17),
      ],
      favorites: [
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavoritesModel(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
      ],
    );
  }
}
