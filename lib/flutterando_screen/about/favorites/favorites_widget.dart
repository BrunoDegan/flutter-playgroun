import 'package:flutter/material.dart';
import 'package:flutter_playground/flutterando_screen/about/data/flutterando_about_data.dart';
import 'package:flutter_playground/flutterando_screen/about/favorites/favorites_list_tile.dart';
import 'package:flutter_playground/flutterando_screen/strings/flutterando_strings.dart';

class FavoritesWidget extends StatelessWidget {
  final FlutterandoAboutData data;

  const FavoritesWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(FAVORITE_TECHNOLOGIES),
          ),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, pos) {
              return FavoritesListTile(data: data.favorites[pos]);
            },
          ),
        ],
      ),
    );
  }
}
