import 'package:flutter_playground/flutterando_page/about/data/flutterando_about_data.dart';
import 'package:flutter_playground/flutterando_page/about/data/flutterando_favorites.dart';
import 'package:flutter_playground/flutterando_page/about/data/flutterando_skill_data.dart';

class AboutPageDataSource {
  AboutPageDataSource();

  FlutterandoAboutData getAboutData() {
    return FlutterandoAboutData(
      userImagePath: "assets/flutterando_screen/profile_image.jpeg",
      userName: "Bruno Degan",
      description: """Duis rhoncus dui venenatis consequat porttitor. Etiam 
      aliquet congue consequat. In posuere, nunc sit amet
      laoreet blandit, urna sapien.""",
      skillsList: [
        Skills(title: "Flutter", percentage: 62),
        Skills(title: "Android", percentage: 100),
        Skills(title: "Dart", percentage: 50),
        Skills(title: "Kotlin", percentage: 92),
        Skills(title: "Python", percentage: 58),
        Skills(title: "Machine learning", percentage: 43),
        Skills(title: "Data Science", percentage: 34),
        Skills(title: "C/C++", percentage: 17),
      ],
      favorites: [
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutterando_screen/flutter.png",
        ),
      ],
    );
  }
}
