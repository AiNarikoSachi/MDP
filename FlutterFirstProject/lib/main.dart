import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyStatelessWidget(),
      ),
    );
  }
}



class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

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
                child: Image.asset('image/marvel.png')),
            const SizedBox(
              width: 800,
              height: 300,

              child: Padding(
                padding: EdgeInsets.fromLTRB(80,130,0,0),
                child: Text("Choose your hero",style: TextStyle(color: Colors.black, fontSize: 30),),),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 175, 0, 0),

              child: PageView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[

                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'image/Blade.jpg',
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(125, 400, 20, 0),
                        child: Text(
                          "Blade",
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'image/Ghost_rider.jpg',
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(50, 400, 20, 0),
                        child: Text(
                          "Ghost_rider",
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'image/Iron_fist.jpg',
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(100, 400, 20, 0),
                        child: Text(
                          "Iron_fist",
                          style: TextStyle(color: Colors.black, fontSize: 60),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'image/Magneto.jpg',
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(75, 400, 20, 0),
                        child: Text(
                          "Magneto",
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        'image/Punisher.jpg',
                        fit: BoxFit.fill,
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(75, 400, 20, 0),
                        child: Text(
                          "Punisher",
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}