import 'package:flutter/material.dart';
import 'package:flutter_playground/src/flutterando_page/about/favorites/favorites_list_tile.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_about_model.dart';
import 'package:flutter_playground/src/flutterando_page/strings/flutterando_strings.dart';

class FavoritesWidget extends StatefulWidget {
  final FlutterandoAboutModel data;

  const FavoritesWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoritesWidget> {
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
            itemCount: widget.data.favorites.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FavoritesListTileWidget(
                  data: widget.data.favorites[index]);
            },
          ),
        )
      ],
    );
  }
}
