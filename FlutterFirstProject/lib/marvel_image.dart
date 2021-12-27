import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'marvel.dart';

class MarvelImage extends StatelessWidget {
  final Marvel marvel;

  const MarvelImage({Key? key, required this.marvel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(fit: BoxFit.cover, imageUrl: marvel.image);
  }
}
