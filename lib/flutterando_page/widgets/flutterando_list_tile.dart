import 'package:flutter/material.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/common/text_formatter.dart';
import 'package:flutter_playground/flutterando_page/about/data/flutterando_list_data.dart';

class FlutterandoListTile extends StatefulWidget {
  final FlutterandoListData item;
  final Function onCardClicked;

  const FlutterandoListTile(
      {Key? key, required this.item, required this.onCardClicked})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _FlutterandoListTileState();
}

class _FlutterandoListTileState extends State<FlutterandoListTile> {
  final Duration _duration = const Duration(milliseconds: 100);
  final Curve _curve = Curves.linear;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        side: BorderSide(
          width: 0.5,
          color: Colors.white,
        ),
      ),
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
              headerTitle: widget.item.title,
            ),
          ),
          const Spacer(),
          getFlutterandoCounterFormatted(
            counterText: widget.item.counter.toString(),
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
            widget.item.imageUrl,
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
            bodyInfo: widget.item.subtitle,
          ),
        ),
      );

  _seeMoreButton() {
    return ElevatedButton(
      child: const Text(flutterandoSeeMoreInfo),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
              color: Color(0xFFEDF4F8),
              fontSize: 12,
              fontFamily: "Poppins-SemiBold"),
        ),
        backgroundColor: _isPressed
            ? MaterialStateProperty.all(const Color.fromARGB(255, 5, 45, 80))
            : MaterialStateProperty.all(const Color(0xFF055AA3)),
        minimumSize: MaterialStateProperty.all(
          const Size(119.0, 34.5),
        ),
      ),
      onPressed: () {
        _isPressed = !_isPressed;
        Future.delayed(_duration, () {
          widget.onCardClicked.call();
        });
      },
    );
  }

  _bottomCardView() => Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 18, right: 4, bottom: 29),
              child: Image.asset("assets/flutterando_screen/github_icon.png")),
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 25),
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
            padding: const EdgeInsets.only(bottom: 25, right: 10),
            child: _seeMoreButton(),
          ),
        ],
      );
}
