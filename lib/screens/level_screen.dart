import 'package:flutter/material.dart';
import 'package:lesan/screens/chooseImage_screen.dart';

class LevelScreen extends StatelessWidget {
  static const routeName = 'level_screen';

  @override
  Widget build(BuildContext context) {
    return Level();
  }
}

class Level extends StatefulWidget {
  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.flag),
            Icon(Icons.cast),
            Icon(Icons.find_replace),
            Icon(Icons.headset, color: Colors.red)
          ],
        ),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChooseImageScreen()),
                  );
                },
                child: Column(
                    children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/egg.png'),
                              fit: BoxFit.contain
                          )
                          )
                      ),
                      Text(
                        'Basics 1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
            ]
          ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          Container(
                              height: 80,
                              width: 80,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/briefcase.png'),
                                      fit: BoxFit.contain
                                  )
                              )
                          ),
                          Text(
                            'Greetings',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]
                    ),
                    Column(
                        children: <Widget>[
                          Container(
                              height: 80,
                              width: 80,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/hatchingegg.png'),
                                      fit: BoxFit.contain
                                  )
                              )
                          ),
                          Text(
                            'Basics 2',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]
                    ),
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/oldman.png'),
                                    fit: BoxFit.contain
                                )
                            )
                        ),
                        Text(
                          'People',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                  ),
                  Column(
                      children: <Widget>[
                        Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/plane.png'),
                                    fit: BoxFit.contain
                                )
                            )
                        ),
                        Text(
                          'Travel',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/hatchingegg.png'),
                                    fit: BoxFit.contain
                                )
                            )
                        ),
                        Text(
                          'Family',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                  ),
                  Column(
                      children: <Widget>[
                        Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/ball.png'),
                                    fit: BoxFit.contain
                                )
                            )
                        ),
                        Text(
                          'Activities',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                  ),
                  Column(
                      children: <Widget>[
                        Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/oldman.png'),
                                    fit: BoxFit.contain
                                )
                            )
                        ),
                        Text(
                          'People 2',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                    children: <Widget>[
                      Container(
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/rook1.png'),
                                  fit: BoxFit.contain
                              )
                          )
                      ),
                    ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15,0,15,15),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0,0,0,20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              children: <Widget>[
                                Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/briefcase.png'),
                                            fit: BoxFit.contain
                                        )
                                    )
                                ),
                                Text(
                                  'Greetings',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                          Column(
                              children: <Widget>[
                                Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/hatchingegg.png'),
                                            fit: BoxFit.contain
                                        )
                                    )
                                ),
                                Text(
                                  'Basics 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              children: <Widget>[
                                Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/oldman.png'),
                                            fit: BoxFit.contain
                                        )
                                    )
                                ),
                                Text(
                                  'People',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                          Column(
                              children: <Widget>[
                                Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/plane.png'),
                                            fit: BoxFit.contain
                                        )
                                    )
                                ),
                                Text(
                                  'Travel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              children: <Widget>[
                                Container(
                                    height: 70,
                                    width: 70,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/hatchingegg.png'),
                                            fit: BoxFit.contain
                                        )
                                    )
                                ),
                                Text(
                                  'Family',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                          Column(
                              children: <Widget>[
                                Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/ball.png'),
                                            fit: BoxFit.contain
                                        )
                                    )
                                ),
                                Text(
                                  'Activities',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                          Column(
                              children: <Widget>[
                                Container(
                                    height: 80,
                                    width: 80,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('assets/images/oldman.png'),
                                            fit: BoxFit.contain
                                        )
                                    )
                                ),
                                Text(
                                  'People 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ) //level 1


            ],
          ),
        ),
      ),

    );
  }
}