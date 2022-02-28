import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_about_data.dart';

class AboutCardWidget extends StatelessWidget {
  final FlutterandoAboutData data;

  const AboutCardWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 402.0,
      height: 320.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        border: Border.all(),
        shape: BoxShape.rectangle,
        color: const Color(0xFF172026),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(data.userImagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
            child: Text(
              data.userName,
              style: const TextStyle(
                fontFamily: "Poppins-Medium",
                color: Color(0xFFEDF4F8),
                fontSize: 16.0,
              ),
            ),
          ),
          Text(
            data.description,
            style: const TextStyle(
              fontFamily: "Poppins-Medium",
              color: Color(0xFF51565A),
              fontSize: 12.0,
            ),
          ),
          _favoritesListViewBuilder()
        ],
      ),
    );
  }

  _favoritesListViewBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(27.34),
        scrollDirection: Axis.horizontal,
        itemCount: data.skillsList.length,
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            elevation: 2.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(data.favorites[index].imagePath),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
                    child: Text(
                      data.userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w100,
                          color: Color(0xFFEDF4F8),
                          fontFamily: "Poppins-Medium",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                    ),
                  ),
                  Text(
                    data.description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Color(0xFF51565A),
                        fontFamily: "Poppins-Medium",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 42.5, bottom: 26),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                "assets/flutterando_screen/whatsapp.png"),
                          ),
                          const SizedBox(
                            width: 27.34,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                "assets/flutterando_screen/github.png"),
                          ),
                          const SizedBox(
                            width: 27.34,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                "assets/flutterando_screen/instagram.png"),
                          ),
                          const SizedBox(
                            width: 27.34,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                "assets/flutterando_screen/facebook.png"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
