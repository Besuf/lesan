import 'package:flutter/material.dart';
import 'package:lesan/screens/level_screen.dart';
import 'package:lesan/screens/writeSentence_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lesan/models/questionTypes.dart';

enum AnswerState { Correct, Wrong, NotAnswered }

class ChooseImageScreen extends StatelessWidget {
  static const routeName = 'chooseImage_screen';
  final Module module;
  final int index;
  ChooseImageScreen({Key key, @required this.module, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Choose(
      module: module,
      index: index,
    );
  }
}
class Choose extends StatefulWidget {
  final Module module;
  final int index;
  Choose({Key key, @required this.module, this.index}): super(key:key);
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Module module;
  int index;
  double progress;
  Color card1Background;
  Color card1BorderColor;
  Color card2Background;
  Color card2BorderColor;
  Color card3Background;
  Color card3BorderColor;
  Color card4Background;
  Color card4BorderColor;
  Color checkButtonBackground;
  Color checkButtonTextColor;
  String checkText;
  Color resultBackground;
  Color resultTextColor;
  Question1 currentQuestion;
  String currentAnswer;
  String currentResult;
  String currentResultText;
  bool isAnswered;
  AnswerState _answerState;
  String _textContent = '';

  @override
  void initState() {
    // TODO: implement initState
    module = widget.module;
    index = widget.index;
    progress = ((index)/(module.chooseImages.length))/3;
    _answerState = AnswerState.NotAnswered;
    super.initState();
    initQuestion();


  }
  void initUI(){
    card1Background = Colors.white;
    card1BorderColor = Color(0xffe4e4e4);
    card2Background = Colors.white;
    card2BorderColor =  Color(0xffe4e4e4);
    card3Background = Colors.white;
    card3BorderColor =  Color(0xffe4e4e4);
    card4Background = Colors.white;
    card4BorderColor =  Color(0xffe4e4e4);
    checkButtonBackground = Color(0xFFDCDCDC);
    checkButtonTextColor = Colors.white;
    resultBackground = Colors.white24;
    resultTextColor = Colors.white;
    checkText = 'CHECK';
    currentResult='';
    currentResultText='';
    isAnswered = false;
  }
  void initQuestion(){
    print('option1'+module.chooseImages[this.index].option1.imgURL);
    Question1Card firstOption = Question1Card(
        optionName: module.chooseImages[this.index].option1.optionName,
        imgURL:  module.chooseImages[this.index].option1.imgURL,
        soundURL:  module.chooseImages[this.index].option1.soundURL
    );
    Question1Card secondOption = Question1Card(
        optionName: module.chooseImages[this.index].option2.optionName,
        imgURL:  module.chooseImages[this.index].option2.imgURL,
        soundURL:  module.chooseImages[this.index].option2.soundURL
    );
    Question1Card thirdOption = Question1Card(
        optionName: module.chooseImages[this.index].option3.optionName,
        imgURL:  module.chooseImages[this.index].option3.imgURL,
        soundURL:  module.chooseImages[this.index].option3.soundURL
    );
    Question1Card fourthOption = Question1Card(
        optionName: module.chooseImages[this.index].option4.optionName,
        imgURL:  module.chooseImages[this.index].option4.imgURL,
        soundURL:  module.chooseImages[this.index].option4.soundURL
    );
    Question1 firstQuestion = Question1(
        question: module.chooseImages[this.index].question,
        option1: firstOption,
        option2: secondOption,
        option3: thirdOption,
        option4: fourthOption,
        answer: module.chooseImages[this.index].answer
    );
    setState(() {
      initUI();
      currentQuestion = firstQuestion;
      currentAnswer = '';
    });
  }
  void nextQuestion(){
    int nextIndex;
    if(module.chooseImages.length==this.index+1){
      nextIndex = 0;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WriteSentenceScreen(
          module: this.module,
          index: nextIndex,
        )),
      );
    }
    else{
      nextIndex = this.index + 1;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChooseImageScreen(
          module: this.module,
          index: nextIndex,
        )),
      );
    }

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
  void playSound(String fileName){
    final player  = AudioCache();
    player.play(fileName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: _answerState==AnswerState.NotAnswered?
                MainAxisAlignment.spaceEvenly:
                MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 10,
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

              Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
                  child: Text(
                     currentQuestion.question,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,

                    ),
                  )
              ),//Question
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        card1BorderColor = Colors.white;
                        card1Background = Color(0x99ff8d3b);
                        card3BorderColor = Colors.grey;
                        card3Background = Colors.white;
                        card4BorderColor = Colors.grey;
                        card4Background = Colors.white;
                        card2BorderColor = Colors.grey;
                        card2Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Color(0xff3a3042);
                        currentAnswer = currentQuestion.option1.optionName;
                      });
                      playSound(currentQuestion.option1.soundURL);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: 150,
                      width: 130,
                      decoration: BoxDecoration(
                          color: card1Background,
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            top: BorderSide(width: 1.0, color: card1BorderColor),
                            left: BorderSide(width: 1.0, color: card1BorderColor),
                            right: BorderSide(width: 1.0, color: card1BorderColor),
                            bottom: BorderSide(width: 1.0, color: card1BorderColor),
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(currentQuestion.option1.imgURL),
                                    fit: BoxFit.contain
                                ),

                              )
                          ),
                          Text(
                            currentQuestion.option1.optionName,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        card2BorderColor = Colors.white;
                        card2Background = Color(0x99ff8d3b);
                        card1BorderColor = Colors.grey;
                        card1Background = Colors.white;
                        card3BorderColor = Colors.grey;
                        card3Background = Colors.white;
                        card4BorderColor = Colors.grey;
                        card4Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Color(0xff3a3042);
                        currentAnswer = currentQuestion.option2.optionName;
                      });
                      playSound(currentQuestion.option2.soundURL);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: 150,
                      width: 130,
                      decoration: BoxDecoration(
                          color: card2Background,
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            top: BorderSide(width: 1.0, color: card2BorderColor),
                            left: BorderSide(width: 1.0, color: card2BorderColor),
                            right: BorderSide(width: 1.0, color: card2BorderColor),
                            bottom: BorderSide(width: 1.0, color: card2BorderColor),
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(currentQuestion.option2.imgURL),
                                    fit: BoxFit.contain
                                ),

                              )
                          ),
                          Text(
                            currentQuestion.option2.optionName,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),//option 1&2
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        card3BorderColor = Colors.white;
                        card3Background = Color(0x99ff8d3b);
                        card1BorderColor = Colors.grey;
                        card1Background = Colors.white;
                        card2BorderColor = Colors.grey;
                        card2Background = Colors.white;
                        card4BorderColor = Colors.grey;
                        card4Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Color(0xff3a3042);
                        currentAnswer = currentQuestion.option3.optionName;
                      });
                      playSound(currentQuestion.option3.soundURL);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: 150,
                      width: 130,
                      decoration: BoxDecoration(
                          color: card3Background,
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            top: BorderSide(width: 1.0, color: card3BorderColor),
                            left: BorderSide(width: 1.0, color: card3BorderColor),
                            right: BorderSide(width: 1.0, color: card3BorderColor),
                            bottom: BorderSide(width: 1.0, color: card3BorderColor),
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(currentQuestion.option3.imgURL),
                                    fit: BoxFit.contain
                                ),

                              )
                          ),
                          Text(
                            currentQuestion.option3.optionName,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        card4BorderColor = Colors.white;
                        card4Background = Color(0x99ff8d3b);
                        card1BorderColor = Colors.grey;
                        card1Background = Colors.white;
                        card3BorderColor = Colors.grey;
                        card3Background = Colors.white;
                        card2BorderColor = Colors.grey;
                        card2Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Color(0xff3a3042);
                        currentAnswer = currentQuestion.option2.optionName;
                      });
                      playSound(currentQuestion.option4.soundURL);
                    },
                    child: Container(
                      margin: EdgeInsets.all(15),
                      height: 150,
                      width: 130,
                      decoration: BoxDecoration(
                          color: card4Background,
                          borderRadius: BorderRadius.circular(5),
                          border: Border(
                            top: BorderSide(width: 1.0, color: card4BorderColor),
                            left: BorderSide(width: 1.0, color: card4BorderColor),
                            right: BorderSide(width: 1.0, color: card4BorderColor),
                            bottom: BorderSide(width: 1.0, color: card4BorderColor),
                          )
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 100,
                              width: 100,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(currentQuestion.option4.imgURL),
                                    fit: BoxFit.contain
                                ),

                              )
                          ),
                          Text(
                            currentQuestion.option4.optionName,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),//option 3&4
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
                                //do something
                                if(_answerState!=AnswerState.NotAnswered){
                                  setState(() {
                                    nextQuestion();
                                  });
                                }
                                else if(_answerState==AnswerState.NotAnswered && currentAnswer == currentQuestion.answer){
                                  playSound('audios/correct.wav');
                                  correctAnswer();
                                  setState(() {
                                    progress = ((index+1)/(module.chooseImages.length))/3;
                                  });
                                  setState(() {
                                    _answerState = AnswerState.Correct;
                                    checkText = 'NEXT';
                                    checkButtonBackground = Color(0xffff8d3b);
                                  });

                                }
                                else if(currentAnswer != currentQuestion.answer){
                                  playSound('audios/incorrect.wav');
                                  wrongAnswer(currentQuestion.answer);
                                  setState(() {
                                    progress = ((index+1)/(module.chooseImages.length))/3;
                                  });
                                  setState(() {
                                    _answerState = AnswerState.Wrong;
                                    checkText = 'NEXT';
                                    checkButtonBackground = Color(0xff3a3042);
                                  });

                                }

                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: 300,
                                height: 30,
                                child: Text(
                                  checkText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: checkButtonTextColor,
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
        ),
      ),
    );
  }
}




