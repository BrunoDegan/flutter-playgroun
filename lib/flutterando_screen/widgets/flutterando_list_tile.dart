import 'package:flutter/material.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/common/text_formatter.dart';
import 'package:flutter_playground/flutterando_screen/data/flutterando_item.dart';

class FlutterandoListTile extends StatelessWidget {
  final FlutterandoItem item;
  final Function onCardClicked;
  const FlutterandoListTile(
      {Key? key, required this.item, required this.onCardClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: const BorderRadius.all(
        Radius.circular(40.0),
      ),
      child: Card(
        elevation: 2.0,
        child: Container(
          height: 220.0,
          width: 400.0,
          color: const Color(0xFF172026),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _topCardView(),
              const Spacer(),
              _bodyCardView(),
              const Spacer(),
              _bottomCardView(),
            ],
          ),
        ),
      ),
    );
  }

  _topCardView() {
    return Padding(
      padding: const EdgeInsets.all(
        12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _cardIcon(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: getFlutterandoHeaderTitleStyle(
              headerTitle: item.title,
            ),
          ),
          const Spacer(),
          getFlutterandoCounterFormatted(
            counterText: item.counter.toString(),
          ),
        ],
      ),
    );
  }

  _cardIcon() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(
          0xFF055AA3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Center(
          child: Image.asset(
            item.imageUrl,
            width: 43.0,
            height: 43.0,
          ),
        ),
      ),
    );
  }

  _bodyCardView() => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: getFlutterandoCardBodyTextFormatted(
            bodyInfo: item.subtitle,
          ),
        ),
      );

  _seeMoreButton() => GestureDetector(
        child: Container(
          width: 119.0,
          height: 34.5,
          decoration: BoxDecoration(
            color: const Color(0xFF055AA3),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Center(
            child: Text(
              flutterandoSeeMoreInfo,
              style: TextStyle(
                  color: Color(0xFFEDF4F8),
                  fontSize: 12,
                  fontFamily: "Poppins-SemiBold"),
            ),
          ),
        ),
        onTap: () => onCardClicked.call(),
      );

  _bottomCardView() => Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 18, right: 4, bottom: 29),
              child: Image.asset("assets/flutterando_screen/github_icon.png")),
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 30),
            child: Text(
              flutterandoCodeSource,
              style: TextStyle(
                  color: Color(0xFFEDF4F8),
                  fontSize: 12,
                  fontFamily: "Montserrat"),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 35, right: 10),
            child: _seeMoreButton(),
          ),
        ],
      );
}
