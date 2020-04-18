import 'package:flutter/material.dart';

import 'package:lesan/screens/level_screen.dart';
import 'package:lesan/screens/word_puzzle_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lesan/models/questionTypes.dart';

class WriteSentenceScreen extends StatelessWidget {
  static final String routeName = 'writeSentence_screen';
  final Module module;
  final int index;
  WriteSentenceScreen({Key key, @required this.module, this.index}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return WriteSentence(
      module: module,
      index: index
    );
  }
}

class WriteSentence extends StatefulWidget {
  final Module module;
  final int index;
  WriteSentence({Key key, @required this.module, this.index}): super(key:key);
  @override
  _WriteSentenceState createState() => _WriteSentenceState();
}

class _WriteSentenceState extends State<WriteSentence> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Module module;
  int index;
  double progress;
  Question3 currentQuestion;
  List<Word3> currentAnswer = List<Word3>();
  String checkText = 'Check';

  @override
  void initState() {
    // TODO: implement initState
    module = widget.module;
    index = widget.index;
    progress = 0.33 + ((index)/(module.chooseImages.length))/3;
    super.initState();
    initQuestion();
  }
  void initQuestion(){
      List<Word3> options = module.writeSentences[this.index].options;
      List<Word3> correctAnswer = module.writeSentences[this.index].correctAnswer;
      Question3 q1 = Question3(
        questionAudioURL: module.writeSentences[this.index].questionAudioURL,
        options: options,
        correctAnswer: correctAnswer,
      );
      currentQuestion = q1;
  }
  void nextQuestion(){
    int nextIndex;
    if(module.chooseImages.length==this.index+1){
      nextIndex = 0;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WordPuzzle(
          module: this.module,
          index: nextIndex,
        )),
      );
    }
    else{
      nextIndex = this.index + 1;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WriteSentenceScreen(
          module: this.module,
          index: nextIndex,
        )),
      );
    }

  }
  void playSound(String fileName){
    final player  = AudioCache();
    player.play(fileName);
  }
  bool isCorrect(){
    bool result = true;
    if(currentAnswer.length!=currentQuestion.options.length){
      result = false;
    }
    for(int i=0; i<currentAnswer.length;i++){
      if(currentAnswer[i].text != currentQuestion.correctAnswer[i].text){
        result = false;
      }
    }
    return result;
  }
  Widget getOptionsWidget(){
    if(currentQuestion.options.length <= 3){
      print('called');
      List<GestureDetector> r1Chips = List<GestureDetector>();
      for(int i=0; i<currentQuestion.options.length;i++){
          r1Chips.add(
               GestureDetector(
                 onTap: (){
                   if(!currentQuestion.options[i].isSelected)
                     setState(() {
                       currentAnswer.add(currentQuestion.options[i]);
                       currentQuestion.options[i].isSelected = true;
                     });
                 },
                 child: Chip(
                   label: currentQuestion.options[i].isSelected ? Text('') : Text(currentQuestion.options[i].text, style: TextStyle(color: Colors.white),),
                   backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Colors.green,
                   elevation:  currentQuestion.options[i].isSelected ? 0 : 10 ,
              ),
               )
          );
      }
      return(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: r1Chips,
        )
      );
    }
    else if(currentQuestion.options.length <= 6){
      List<GestureDetector> r1Chips = List<GestureDetector>();
      List<GestureDetector> r2Chips = List<GestureDetector>();
      for(int i=0; i<currentQuestion.options.length;i++){
        if(i<3){
          r1Chips.add(
              GestureDetector(
                onTap: (){
                  if(!currentQuestion.options[i].isSelected)
                      setState(() {
                        currentAnswer.add(currentQuestion.options[i]);
                        currentQuestion.options[i].isSelected = true;
                      });
                },
                child: Chip(
                  label: currentQuestion.options[i].isSelected ? Text('') : Text(currentQuestion.options[i].text,style: TextStyle(color: Colors.white),),
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Colors.green,
                  elevation:  currentQuestion.options[i].isSelected ? 0 : 10 ,
                ),
              )
          );
        }
        else{
          r2Chips.add(
              GestureDetector(
                onTap: (){
                  if(!currentQuestion.options[i].isSelected)
                    setState(() {
                      currentAnswer.add(currentQuestion.options[i]);
                      currentQuestion.options[i].isSelected = true;
                    });
                },
                child: Chip(
                  label: currentQuestion.options[i].isSelected ? Text('') : Text(currentQuestion.options[i].text,style: TextStyle(color: Colors.white),),
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Colors.green,
                  elevation:  currentQuestion.options[i].isSelected ? 0 : 10 ,
                ),
              )
          );
        }

      }
      return(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: r1Chips,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: r2Chips,
            ),

          ],
        )
      );
    }
    else if(currentQuestion.options.length<=9) {
      List<GestureDetector> r1Chips = List<GestureDetector>();
      List<GestureDetector> r2Chips = List<GestureDetector>();
      List<GestureDetector> r3Chips = List<GestureDetector>();
      for(int i=0; i<currentQuestion.options.length;i++){
        if(i<3){
          r1Chips.add(
              GestureDetector(
                onTap: (){
                  if(!currentQuestion.options[i].isSelected)
                    setState(() {
                      currentAnswer.add(currentQuestion.options[i]);
                      currentQuestion.options[i].isSelected = true;
                    });
                },
                child: Chip(
                  label: currentQuestion.options[i].isSelected ? Text('') : Text(currentQuestion.options[i].text, style: TextStyle(color: Colors.white),),
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Colors.green,
                  elevation:  currentQuestion.options[i].isSelected ? 0 : 10 ,
                ),
              )
          );
        }
        else if(i<6){
          r2Chips.add(
              GestureDetector(
                onTap: (){
                  if(!currentQuestion.options[i].isSelected)
                    setState(() {
                      currentAnswer.add(currentQuestion.options[i]);
                      currentQuestion.options[i].isSelected = true;
                    });
                },
                child: Chip(
                  label: currentQuestion.options[i].isSelected ? Text('') : Text(currentQuestion.options[i].text, style: TextStyle(color: Colors.white),),
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Colors.green,
                  elevation:  currentQuestion.options[i].isSelected ? 0 : 10 ,
                ),
              )
          );
        }
        else if(i<9){
          r3Chips.add(
              GestureDetector(
                onTap: (){
                  if(!currentQuestion.options[i].isSelected)
                    setState(() {
                      currentAnswer.add(currentQuestion.options[i]);
                      currentQuestion.options[i].isSelected = true;
                    });
                },
                child: Chip(
                  label: currentQuestion.options[i].isSelected ? Text('') : Text(currentQuestion.options[i].text, style: TextStyle(color: Colors.white),),
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Colors.green,
                  elevation:  currentQuestion.options[i].isSelected ? 0 : 10 ,
                ),
              )
          );
        }
      }
      return(
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: r1Chips,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: r2Chips,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: r3Chips,
              )

            ],
          )
      );
    }
    for(int i=0; i<currentQuestion.options.length;i++){

    }

  }
  Widget getFirstRowAnswerWidget(){
    List<GestureDetector> r1 = List<GestureDetector>();
    r1.add(
        GestureDetector(
          child: Chip(
            label: Text(''),
            backgroundColor: Colors.white24,
          ),
        ));
    for(int i=0;i<currentAnswer.length;i++){
      if(i>2)break;
      r1.add(
          GestureDetector(
            onTap: (){
              setState(() {
                currentQuestion.options[currentQuestion.options.indexOf(currentAnswer[i])].isSelected=false;
                currentAnswer.removeAt(i);
              });
            },
            child: Chip(
              label: Text(currentAnswer[i].text, style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.green,
            ),
      ));
    }
    return(
      Row(
        children: r1,
        mainAxisAlignment: MainAxisAlignment.start,
      )
    );
  }
  Widget getSecondRowAnswerWidget(){
    List<GestureDetector> r1 = List<GestureDetector>();
    r1.add(
        GestureDetector(
          child: Chip(
            label: Text(''),
            backgroundColor: Colors.white24,
          ),
        ));
    for(int i=3;i<currentAnswer.length;i++){
      if(i>5)break;
      r1.add(
          GestureDetector(
            onTap: (){
              setState(() {
                currentQuestion.options[currentQuestion.options.indexOf(currentAnswer[i])].isSelected=false;
                currentAnswer.removeAt(i);
              });
            },
            child: Chip(
              label: Text(
                currentAnswer[i].text,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              backgroundColor: Colors.green,
            ),
          ));
    }
    return(
        Row(
          children: r1,
          mainAxisAlignment: MainAxisAlignment.start,
        )
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LevelScreen()),
                        );
                      },
                      child: Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 200,
                        height: 20,
                        child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                            backgroundColor: Color(0xFFE6E6E6),
                            value: progress
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.redAccent,
                    ),

                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'Tap what you hear',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                ),
                GestureDetector(
                  onTap: (){
                    playSound(currentQuestion.questionAudioURL);
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 40),
                    color: Colors.lightBlueAccent,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Icon(
                        Icons.volume_up,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                    elevation: 10,
                  ),
                ),//sound
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: getFirstRowAnswerWidget(),
                    ),//first row content
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 1,
                      width: 300,
                      color: Colors.black,
                    ),//line for first row
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: getSecondRowAnswerWidget(),
                    ),//second row content
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      height: 1,
                      width: 300,
                      color: Colors.black,
                    ),//line for second row

                  ],
                ),//answer space
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: getOptionsWidget()
                ),//options
                Center(
                  child: Column(
                    children: <Widget>[
                      Card(

                        child: Container(
                          width: 300,
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Can\'t listen now',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if(checkText=='Check'){
                              setState(() {
                                progress = 0.33+((index+1)/(module.chooseImages.length))/3;
                              });
                              String t1,t2='';
                              Color background;
                              if(isCorrect()){
                                playSound('audios/correct.wav');
                                t1 = 'Correct';
                                t2 = '';
                                background = Colors.greenAccent;
                              }else{
                                playSound('audios/incorrect.wav');
                                t1 = 'Incorrect';
                                for(int i=0; i<currentQuestion.correctAnswer.length; i++){
                                  t2 += currentQuestion.correctAnswer[i].text;
                                }
                                background = Colors.redAccent;
                              }
                              checkText = 'Continue';
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                  content: Text(
                                    t1,
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  backgroundColor: background,
                                ),
                              );
                            }else{
                              nextQuestion();
                            }

                          });

                        },
                        child: Card(
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.all(10),
                            child: Text(
                              checkText,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                )//answer buttons

              ],
            ),
          )
      ),


    );
  }
}

