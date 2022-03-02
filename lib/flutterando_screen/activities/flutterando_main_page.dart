import 'package:flutter/material.dart';
import 'package:flutter_playground/common/list_constants.dart';
import 'package:flutter_playground/flutterando_screen/widgets/flutterando_list_tile.dart';
import 'package:flutter_playground/flutterando_screen/widgets/flutterando_top_bar_widget.dart';
import 'package:flutter_playground/routes/constants_router.dart';

class FlutterandoActivitiesPage extends StatefulWidget {
  const FlutterandoActivitiesPage({Key? key}) : super(key: key);

  @override
  State<FlutterandoActivitiesPage> createState() =>
      _FlutterandoActivitiesPageState();
}

class _FlutterandoActivitiesPageState extends State<FlutterandoActivitiesPage> {
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
    );
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
