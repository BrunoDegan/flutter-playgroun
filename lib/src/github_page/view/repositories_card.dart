import 'package:flutter/material.dart';
import 'package:flutter_playground/src/github_page/model/repository_model.dart';

class RepositoryCard extends StatelessWidget {
  final RepositoryModel model;

  const RepositoryCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(model.name),
        ],
      ),
    );
  }
}
