import 'package:flutter/material.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/common/text_formatter.dart';
import 'package:flutter_playground/flutterando_screen/data/flutterando_item.dart';

class FlutterandoListTile extends StatelessWidget {
  final FlutterandoItem item;
  const FlutterandoListTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 2.0,
      child: Container(
        height: 220.0,
        width: 400.0,
        color: const Color(0xFF172026),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _topCardView(),
            const Spacer(),
            _bodyCardView(),
            const Spacer(),
            // _bottomCardView(),
          ],
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

  _bodyCardView() {
    return getFlutterandoCardBodyTextFormatted(
      bodyInfo: item.subtitle,
    );
  }

  _seeMoreButton() => Container(
        width: 119.0,
        height: 34.5,
        decoration: BoxDecoration(
          color: const Color(0xFF055AA3),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          flutterandoSeeMoreInfo,
          style: TextStyle(
              color: Color(0xFFEDF4F8),
              fontSize: 12,
              fontFamily: "Poppins-SemiBold"),
        ),
      );

  _bottomCardView() {
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 14.0,
            right: 4.5,
          ),
          child: Image.asset("assets/flutterando_screen/github_icon.png"),
        ),
        const Text(
          flutterandoCodeSource,
          style: TextStyle(
              color: Color(0xFFEDF4F8), fontSize: 12, fontFamily: "Montserrat"),
        ),
        _seeMoreButton(),
      ],
    );
  }
}
