import 'package:flutter/material.dart';
import 'package:flutterfirstproject/marvel_api.dart';
import 'package:flutterfirstproject/marvel_info.dart';

import 'marvel.dart';
import 'marvel_placeholder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.grey),
      home: const Scaffold(
        body: MarvelPageView(),
      ),
    );
  }
}

class MarvelPageView extends StatefulWidget {
  const MarvelPageView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyStatelessWidget();
}

class _MyStatelessWidget extends State<MarvelPageView> {
  final controller = PageController(viewportFraction: 0.85);

  List<Marvel> heroes = [];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    MarvelApi api = MarvelApi();
    api.readFirstHeroes(50).then((values) {
      setState(() {
        isLoaded = true;
        heroes = values;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const MarvelPlaceholder(message: "Loading...");
    }

    if (isLoaded && heroes.isEmpty) {
      return const MarvelPlaceholder(
        message: 'Heroes not found',
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            width: 200,
            margin: const EdgeInsets.all(20),
            child: Image.asset('image/marvel.png')),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
          child: const Text(
            'Choose your hero',
            style: TextStyle(
                color: Colors.white, fontSize: 38, fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              padEnds: true,
              itemCount: heroes.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MarvelInfo(
                                marvel: heroes[index],
                              ))),
                      child: Hero(
                        tag: heroes[index].id,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 15,
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              Image.network(
                                heroes[index].image,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                                alignment: Alignment.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  heroes[index].name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
      ],
    );
  }
}
