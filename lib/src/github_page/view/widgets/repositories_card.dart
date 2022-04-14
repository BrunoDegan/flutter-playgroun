import 'package:flutter/material.dart';
import 'package:flutter_playground/src/github_page/model/repository_model.dart';

class RepositoryCard extends StatelessWidget {
  final RepositoryModel model;

  const RepositoryCard({Key? key, required this.model}) : super(key: key);

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
        width: 200.0,
        color: const Color(0xFF172026),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                model.name ?? 'Não disponível',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              child: Text(
                model.description ?? 'Description unavailable',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.stars_sharp),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      model.stars != null ? model.stars.toString() : '0',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    model.language != null
                        ? 'Language: ${model.language}'
                        : 'Language Unavailable',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
