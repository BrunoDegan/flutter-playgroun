import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_page/about/data/flutterando_about_model.dart';
import 'package:flutter_playground/flutterando_page/about/favorites/favorites_list_tile.dart';
import 'package:flutter_playground/flutterando_page/strings/flutterando_strings.dart';

class FavoritesWidget extends StatelessWidget {
  final FlutterandoAboutModel data;

  const FavoritesWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 14, bottom: 8.0),
          child: Text(
            FAVORITE_TECHNOLOGIES,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              fontFamily: "Poppins-Medium",
              color: Color(0xFFEDF4F8),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: data.favorites.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FavoritesListTile(data: data.favorites[index]);
            },
          ),
        )
      ],
    );
  }
}
