import 'package:flutter/material.dart';
import 'package:flutter_playground/common/list_constants.dart';
import 'package:flutter_playground/common/strings_constants.dart';
import 'package:flutter_playground/flutterando_screen/widgets/flutterando_list_tile.dart';
import 'package:flutter_playground/flutterando_screen/widgets/flutterando_top_bar_widget.dart';
import 'package:flutter_playground/routes/constants_router.dart';

class FlutterandoMainPage extends StatefulWidget {
  const FlutterandoMainPage({Key? key}) : super(key: key);

  @override
  State<FlutterandoMainPage> createState() => _FlutterandoMainPageState();
}

class _FlutterandoMainPageState extends State<FlutterandoMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _contentBody(),
          FlutterandoTopBarWidget(onTopBarButtonClickListener: () {
            //TODO
          }),
        ],
      ),
      bottomNavigationBar:
          BottomAppBar(elevation: 3, child: _bottomButtonNav()),
    );
  }

  Widget _bottomButtonNav() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      color: const Color(0XFF121517),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createBottomSheetButton(
            imagePath: "assets/flutterando_screen/activities_icon.png",
            buttonTextTitle: flutterandoBottomsheetTitle1,
            onClicked: () {
              //TODO criar as outras paginas do bottom navigator
            },
          ),
          Container(
            color: Colors.white,
            width: 0.5,
            height: 50,
          ),
          _createBottomSheetButton(
            imagePath: "assets/flutterando_screen/github_icon.png",
            buttonTextTitle: flutterandoBottomsheetTitle2,
            onClicked: () {
              //TODO criar as outras paginas do bottom navigator
            },
          ),
          Container(
            color: Colors.white,
            width: 0.5,
            height: 50,
          ),
          _createBottomSheetButton(
            materialIcon: Icons.person,
            buttonTextTitle: flutterandoBottomsheetTitle3,
            onClicked: () {
              Navigator.of(context).pushNamed(aboutRoute);
            },
          )
        ],
      ),
    );
  }

  Widget _createBottomSheetButton(
      {required String buttonTextTitle,
      String? imagePath,
      IconData? materialIcon,
      required Function onClicked}) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0XFF121517)),
      ),
      onPressed: () => onClicked.call(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _handleBackgroundImage(imagePath),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              buttonTextTitle,
              style: const TextStyle(fontFamily: "Montserrat"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _handleBackgroundImage(String? imagePath) {
    if (imagePath != null) {
      return Image.asset(
        imagePath,
        width: 20,
        height: 20,
      );
    } else {
      return const Icon(Icons.person);
    }
  }

  _handleScreenFlow(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(animationsRoute);
        break;
      case 1:
        Navigator.of(context).pushNamed(mockupRoute);
        break;
      case 2:
        Navigator.of(context).pushNamed(playgroundRoute);
        break;
      default:
        Navigator.of(context).pushNamed(splashRoute);
    }
  }

  _contentBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 100.0,
        bottom: 0.0,
      ),
      child: ListView.builder(
        itemCount: flutterandoItens.length,
        itemBuilder: (context, index) {
          return FlutterandoListTile(
            item: flutterandoItens[index],
            onCardClicked: () {
              _handleScreenFlow(index);
            },
          );
        },
      ),
    );
  }
}
