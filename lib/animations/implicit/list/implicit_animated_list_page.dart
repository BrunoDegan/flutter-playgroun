import 'package:flutter/material.dart';

import '../../../common/list_constants.dart';
import '../../data/list_data.dart';
import 'implicit_animated_tile.dart';

class ImplicitAnimatedListPage extends StatefulWidget {
  const ImplicitAnimatedListPage({Key? key}) : super(key: key);

  @override
  ImplicitAnimatedListPageState createState() =>
      ImplicitAnimatedListPageState();
}

class ImplicitAnimatedListPageState extends State<ImplicitAnimatedListPage> {
  List<ListData> listData = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i <= 20; i++) {
      listData.add(ListData(
          title: "My expansion tile $i",
          description: lorenIpsum,
          flutterLogo: const FlutterLogo()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Desafio Animação implicita - Lista"),
        leading: IconButton(
          tooltip: 'Voltar',
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return ImplicitAnimatedTile(animationData: listData[index]);
        },
      ),
    );
  }
}
