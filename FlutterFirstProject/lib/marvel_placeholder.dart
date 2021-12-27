import 'package:flutter/material.dart';

class MarvelPlaceholder extends StatelessWidget {
  final String message;
  const MarvelPlaceholder({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children:  [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ]);
  }
}
