import 'package:flutter/material.dart';

import 'marvel.dart';
import 'marvel_image.dart';

class MarvelInfo extends StatelessWidget {
  final Marvel marvel;

  const MarvelInfo({Key? key, required this.marvel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: marvel.id,
        child: Stack(fit: StackFit.expand, children: [
          MarvelImage(marvel: marvel),
          Positioned(
            top: 24,
            left: 8,
            child: RawMaterialButton(
                shape: const CircleBorder(),
                onPressed: () => Navigator.pop(context),
                hoverColor: Colors.grey.shade700,
                child: const Icon(
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
