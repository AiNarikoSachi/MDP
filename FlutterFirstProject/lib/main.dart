import 'package:flutter/material.dart';

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

class Marvel {
  final String name;
  final String image;

  Marvel({ required this.name, required this.image});
}

class MarvelPageView extends StatefulWidget {
  const MarvelPageView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyStatelessWidget();
}

class _MyStatelessWidget extends State<MarvelPageView> {
  final controller = PageController(viewportFraction: 0.85);

  final List<Marvel> heroes = [
    Marvel(name: "Blade", image: 'image/Blade.jpg'),
    Marvel(name: "Ghost_rider", image: 'image/Ghost_rider.jpg'),
    Marvel(name: "Iron_fist", image: 'image/Iron_fist.jpg'),
    Marvel(name: "Magneto", image: 'image/Magneto.jpg'),
    Marvel(name: "Punisher", image: 'image/Punisher.jpg'),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.grey
      ),
      home: Scaffold(

        body: Stack(

          children:<Widget>[
            Padding(
                padding: const EdgeInsets.fromLTRB(70,30,50,0),
                child: Image.asset('image/marvel.png'),
                ),
            const SizedBox(
              width: 800,
              height: 300,

              child: Padding(
                padding: EdgeInsets.fromLTRB(80,130,0,0),
                child: Text("Choose your hero",style: TextStyle(color: Colors.black, fontSize: 30),),),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 175, 0, 10),
              child: PageView.builder(
                  controller: controller,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  padEnds: true,
                  itemCount: heroes.length,
                  itemBuilder: (context, index)=> Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(
                            heroes[index].image,
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                            alignment: Alignment.center,
                          ),
                           Container(
                            margin: const EdgeInsets.fromLTRB(40, 380, 20, 0),
                            child: Text(
                              heroes[index].name,
                              style: const TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),   ],
        ),
      ),
    );
  }
}