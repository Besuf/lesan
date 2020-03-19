import 'package:flutter/material.dart';
import 'package:lesan/screens/question1_screen.dart';

class LevelsScreen extends StatelessWidget {
  static final String id = 'levels_screen';
  @override
  Widget build(BuildContext context) {
    return Levels();
  }
}

class Levels extends StatefulWidget {
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesan'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                  'LESAN',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,

              ),
          ),
            ListTile(
              title: Text('Account', style: TextStyle(fontSize: 18, color: Colors.grey),),
              subtitle: Text('Log out', style: TextStyle(fontSize: 13, color: Colors.grey),),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 50),
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(4,6),
                  image: AssetImage('assets/images/style.png'),
                  fit: BoxFit.contain
                ),
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(5)
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(20,10,20,10),
                    child: Text(
                      'L E S A N',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,10,20,10),
                    child: Text(
                      '“Change your language and you change your thoughts.”',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),
              
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Question1Screen()),
                );
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(17, 5, 17, 5),
                  height: 80,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10)
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10,5,10,5),
                      child: Text(
                        'Beginner : Level-1',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10,5,10,5),
                      child: Text(
                        'Part 0/30',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17, 5, 17, 5),
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                  color: Color(0xffcecece),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10,5,10,5),
                    child: Text(
                      'Intermidiate : Level-2',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,5,10,5),
                    child: Text(
                      'Part 0/30',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    ),
                  ),
                ],
              ),

            ),
            Container(
              margin: EdgeInsets.fromLTRB(17, 5, 17, 5),
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                  color: Color(0xffcecece),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10,5,10,5),
                    child: Text(
                      'Intermediate : Level-3',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10,5,10,5),
                    child: Text(
                      'Part 0/30',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                    ),
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


