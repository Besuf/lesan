import 'package:flutter/material.dart';

import 'package:lesan/screens/level_screen.dart';
import 'package:lesan/screens/word_puzzle_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lesan/models/questionTypes.dart';

enum AnswerState { Correct, Wrong, NotAnswered }

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
  AnswerState _answerState;
  String _textContent = '';
  Color checkButtonBackground = Color(0xff3a3042);
  @override
  void initState() {
    // TODO: implement initState
    module = widget.module;
    index = widget.index;
    progress = 0.33 + ((index)/(module.chooseImages.length))/3;
    _answerState = AnswerState.NotAnswered;
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
  void correctAnswer() {
    setState(() {
      _answerState = AnswerState.Correct;
      _textContent = 'Correct';
    });
  }

  void wrongAnswer(String correctAnswer) {
    setState(() {
      _answerState = AnswerState.Wrong;
      _textContent = 'Incorrect: answer is \"$correctAnswer\"';
    });
  }

  void reset() {
    setState(() {
      _answerState = AnswerState.NotAnswered;
      _textContent = '';
    });
  }
  bool isCorrect(){
    bool result = true;
    if(currentAnswer.length!=currentQuestion.options.length){
      return false;
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
                   backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Color(0xff5d5d5d),
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
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Color(0xff5d5d5d),
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
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Color(0xff5d5d5d),
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
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Color(0xff5d5d5d),
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
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Color(0xff5d5d5d),
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
                  backgroundColor: currentQuestion.options[i].isSelected ? Colors.white24 : Color(0xff5d5d5d),
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
              backgroundColor: Color(0xff5d5d5d),
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
              backgroundColor: Color(0xff5d5d5d),
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
              mainAxisAlignment: _answerState==AnswerState.NotAnswered?
              MainAxisAlignment.spaceAround:
              MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _answerState==AnswerState.NotAnswered? Container(
                  height: 0,
                ): Container(
                  height: 5,
                ),
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
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xffff8d3b)),
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
                _answerState==AnswerState.NotAnswered? Container(
                  height: 0,
                ): Container(
                  height: 0,
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
                    color: Color(0xffff8d3b),
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
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  AnimatedCrossFade(
                                    firstChild: Container(),
                                    secondChild: Container(
                                      height: 130,
                                      width: double.infinity,
                                      color: _answerState == AnswerState.Correct?
                                      Color(0x99ff8d3b):
                                      Color(0x993a3042),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 10.0),
                                        child: Text(
                                          _textContent,
                                          style: TextStyle(
                                              color: _answerState==AnswerState.Correct?
                                              Color(0xfff1f2f2):
                                              Color(0xfff1f2f2),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900
                                          ),
                                        ),
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 200),
                                    crossFadeState: _answerState == AnswerState.NotAnswered
                                        ? CrossFadeState.showFirst
                                        : CrossFadeState.showSecond,
                                    secondCurve: Curves.easeOutBack.flipped,
                                    firstCurve: Curves.easeOutBack.flipped,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    color: checkButtonBackground,
                                    child: InkWell(
                                      splashColor: Colors.green.withAlpha(30),
                                      onTap: (){
                                        setState(() {
                                          if(_answerState == AnswerState.NotAnswered){
                                            setState(() {
                                              progress = 0.33+((index+1)/(module.chooseImages.length))/3;
                                            });
                                            if(isCorrect()){
                                              playSound('audios/correct.wav');
                                              correctAnswer();
                                              checkButtonBackground = Color(0xffff8d3b);
                                            }else if(!isCorrect()){
                                              checkButtonBackground = Color(0xff3a3042);
                                              playSound('audios/incorrect.wav');
                                              String t2='';
                                              for(int i=0; i<currentQuestion.correctAnswer.length; i++){
                                                t2 += currentQuestion.correctAnswer[i].text + ' ';
                                              }
                                              wrongAnswer(t2);
                                            }
                                            checkText = 'Continue';
                                          }
                                          else{
                                            nextQuestion();
                                          }

                                        });

                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        width: 300,
                                        height: 30,
                                        child: Text(
                                          checkText,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
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

