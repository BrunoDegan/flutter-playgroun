import 'package:flutter/material.dart';

import '../../../common/list_constants.dart';
import '../../data/list_data.dart';
import 'controlled_animated_list_tile.dart';

class ControlledAnimatedListPage extends StatefulWidget {
  const ControlledAnimatedListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ControlledAnimatedListPage();
}

class _ControlledAnimatedListPage extends State<ControlledAnimatedListPage> {
  final List<ListData> _listData = [];

  @override
  void initState() {
    _populateList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Desafio Animação controlada - Lista"),
        leading: IconButton(
          tooltip: 'Voltar',
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _listData.length,
        itemBuilder: (context, index) {
          return ControlledAnimatedListTile(animationData: _listData[index]);
        },
      ),
    );
  }

  void _populateList() {
    for (var i = 0; i <= 20; i++) {
      _listData.add(ListData(
          title: "My expansion tile $i",
          description: lorenIpsum,
          flutterLogo: const FlutterLogo()));
    }
  }
}
