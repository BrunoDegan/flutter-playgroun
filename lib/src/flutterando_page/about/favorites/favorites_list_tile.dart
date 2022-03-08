import 'package:flutter/material.dart';
import 'package:flutter_playground/src/flutterando_page/about/model/flutterando_favorites_model.dart';

class FavoritesListTileWidget extends StatefulWidget {
  FlutterandoFavoritesModel data;
  FavoritesListTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteListTileState();
}

class _FavoriteListTileState extends State<FavoritesListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF172026),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 13,
          left: 28,
          right: 28,
          bottom: 13,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              widget.data.imagePath,
              alignment: Alignment.center,
              width: 38.8,
              height: 46.0,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontFamily: "Poppins-Medium",
                color: Color(0xFFEDF4F8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
