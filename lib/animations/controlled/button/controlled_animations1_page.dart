import 'package:flutter/material.dart';
import 'package:flutter_playground/common/list_constants.dart';

import '../../data/list_data.dart';

class DesafioControlledAnimationsPage1 extends StatefulWidget {
  const DesafioControlledAnimationsPage1({Key? key}) : super(key: key);

  @override
  _DesafioControlledAnimationsState createState() =>
      _DesafioControlledAnimationsState();
}

class _DesafioControlledAnimationsState
    extends State<DesafioControlledAnimationsPage1> {
  List<ListData> listData = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i <= 100; i++) {
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
          title: const Text("Desafio Animação controlada - Botão"),
          leading: IconButton(
            tooltip: 'Voltar',
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container());
    // body: ListView.builder(
    //     itemCount: listData.length,
    //     itemBuilder: (context, index) {
    //       const ListTile(Text(""));
    //     }));
  }
}
