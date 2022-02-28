import 'package:flutter_playground/flutterando_screen/about/data/flutterando_about_data.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_favorites.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_skill_data.dart';

class AboutPageDataSource {
  AboutPageDataSource();

  FlutterandoAboutData getAboutData() {
    return FlutterandoAboutData(
      userImagePath: "assets/profile_image.jpeg",
      userName: "Bruno Degan",
      description: """Duis rhoncus dui venenatis consequat porttitor. Etiam \n 
      aliquet congue consequat. In posuere, nunc sit amet \n 
      laoreet blandit, urna sapien.""",
      skillsList: [
        Skills(title: "Flutter", percentage: 10),
        Skills(title: "Android", percentage: 100),
        Skills(title: "Dart", percentage: 40),
        Skills(title: "Kotlin", percentage: 80),
        Skills(title: "Python", percentage: 60),
        Skills(title: "Machine learning", percentage: 30),
        Skills(title: "Data Science", percentage: 10),
        Skills(title: "C/C++", percentage: 5),
      ],
      favorites: [
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutter.png",
        ),
        FlutterandoFavorites(
          title: "Flutter",
          imagePath: "assets/flutter.png",
        ),
      ],
    );
  }
}
