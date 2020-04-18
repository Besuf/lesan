import 'package:flutter/material.dart';
import 'package:lesan/screens/level_screen.dart';
import 'package:lesan/screens/writeSentence_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lesan/models/questionTypes.dart';
import 'package:flutter_rounded_progress_bar/flutter_icon_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

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
  int questionIndex=0;
  int totalQuestion=2;

  @override
  void initState() {
    // TODO: implement initState
    module = widget.module;
    index = widget.index;
    progress = ((index)/(module.chooseImages.length))/3;
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
    currentQuestion;
    currentAnswer;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        card1BorderColor = Colors.lightBlueAccent;
                        card1Background = Color(0xff9de6ff);
                        card3BorderColor = Colors.grey;
                        card3Background = Colors.white;
                        card4BorderColor = Colors.grey;
                        card4Background = Colors.white;
                        card2BorderColor = Colors.grey;
                        card2Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Colors.green;
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
                        card2BorderColor = Colors.lightBlueAccent;
                        card2Background = Color(0xff9de6ff);
                        card1BorderColor = Colors.grey;
                        card1Background = Colors.white;
                        card3BorderColor = Colors.grey;
                        card3Background = Colors.white;
                        card4BorderColor = Colors.grey;
                        card4Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Colors.green;
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
                        card3BorderColor = Colors.lightBlueAccent;
                        card3Background = Color(0xff9de6ff);
                        card1BorderColor = Colors.grey;
                        card1Background = Colors.white;
                        card2BorderColor = Colors.grey;
                        card2Background = Colors.white;
                        card4BorderColor = Colors.grey;
                        card4Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Colors.green;
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
                        card4BorderColor = Colors.lightBlueAccent;
                        card4Background = Color(0xff9de6ff);
                        card1BorderColor = Colors.grey;
                        card1Background = Colors.white;
                        card3BorderColor = Colors.grey;
                        card3Background = Colors.white;
                        card2BorderColor = Colors.grey;
                        card2Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Colors.green;
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
              Center(
                child: Card(
                  color: checkButtonBackground,
                  child: InkWell(
                    splashColor: Colors.green.withAlpha(30),
                    onTap: (){
                      //do something
                      if(isAnswered){
                        setState(() {
                          nextQuestion();
                        });
                      }
                      else if(!isAnswered && currentAnswer == currentQuestion.answer){
                        playSound('audios/correct.wav');
                        setState(() {
                          progress = ((index+1)/(module.chooseImages.length))/3;
                        });
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            content: Text(
                              'Correct!',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20.0,
                              ),
                            ),
                            backgroundColor: Colors.greenAccent,
                          ),
                        );
                        setState(() {
                          isAnswered = true;
                          resultBackground = Color(0xff9de6ff);
                          resultTextColor = Color(0xff1e8bb7);
                          currentResult = 'CORRECT';
                          checkText = 'NEXT';
                        });

                      }
                      else if(!isAnswered){
                        playSound('audios/incorrect.wav');
                        setState(() {
                          progress = ((index+1)/(module.chooseImages.length))/3;
                        });
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            content: Text(
                              'Incorrect! correct answer is \"'+ currentQuestion.answer+'\"',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        setState(() {
                          isAnswered = true;
                          resultBackground = Color(0xffffb0b0);
                          resultTextColor = Color(0xff9d0000);
                          currentResult = 'WRONG';
                          currentResultText = 'correct answer is \"'+ currentQuestion.answer+'\"';
                          checkText = 'NEXT';
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
              )
            ],
          ),
        ),
      ),
    );
  }
}




