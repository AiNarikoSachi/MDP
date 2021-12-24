import 'package:flutter/material.dart';

import 'marvel.dart';

class MarvelInfo extends StatelessWidget {
  final Marvel marvel;

  const MarvelInfo({Key? key, required this.marvel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
          tag: marvel.id,
          child: Stack(fit: StackFit.expand, children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Image.network(marvel.image),
            ),
            Positioned(
              top: 24,
              left: 8,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    marvel.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    marvel.text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            )
          ]),
        ),
      );
  }
}
