import 'package:flutter/material.dart';
import 'package:flutterfirstproject/marvel_info.dart';

import 'marvel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
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

  final List<Marvel> heroes = [
    Marvel(
        id: 1009191,
        name: "Blade",
        image:
            'http://i.annihil.us/u/prod/marvel/i/mg/8/a0/523ca6f2b11e4/portrait_incredible.jpg',
        text:
            'Himself a half-human/half-vampire, "Daywalker" Eric Brooks has honed his abilities to hunt down the undead who have long terrorized mankind.'),
    Marvel(
        id: 1010925,
        name: "Ghost_rider",
        image:
            'http://i.annihil.us/u/prod/marvel/i/mg/c/50/535feaa671cc6/portrait_incredible.jpg',
        text:
            'Making a demonic deal to save a loved one, biker Johnny Blaze now finds himself cursed to transform into the embodiment of the Spirit of Vengeance.'),
    Marvel(
        id: 1011413,
        name: "Iron_fist",
        image:
            'http://i.annihil.us/u/prod/marvel/i/mg/4/20/53176e89b563e/portrait_incredible.jpg',
        text:
            'Trained in ways of martial arts at K\'un-Lun, Danny Rand becomes the Immortal Iron Fist and uses his incredible abilities to defend others.'),
    Marvel(
        id: 1009417,
        name: "Magneto",
        image:
            'http://i.annihil.us/u/prod/marvel/i/mg/3/b0/5261a7e53f827/portrait_incredible.jpg',
        text:
            'Using his mighty ability to control magnetic fields, the one called Magneto fights to help mutants replace humans as the world\'s dominant species.'),
    Marvel(
        id: 1009515,
        name: "Punisher",
        image:
            'http://i.annihil.us/u/prod/marvel/i/mg/3/90/5261675f6b22f/portrait_incredible.jpg',
        text:
            'Frank Castle was an honest ex-Marine with a family he loved. But when that family was murdered, he became a vigilante with a uniquely brutal brand of justice.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: MaterialApp(
        theme:
            ThemeData(brightness: Brightness.dark, primaryColor: Colors.grey),
        home: Scaffold(
          body: Column(
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
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w500),
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
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MarvelInfo(
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
          ),
        ),
      ),
    );
  }
}
