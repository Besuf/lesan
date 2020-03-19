import 'package:flutter/material.dart';
import 'package:lesan/utilities/question1.dart';

class Question1Screen extends StatelessWidget {
  @override
  static final String id = 'question1_screen';
  Widget build(BuildContext context) {
    return Question1();
  }
}

class Question1 extends StatefulWidget {

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  Color card1Background;
  Color card1BorderColor;
  Color card2Background;
  Color card2BorderColor;
  Color card3Background;
  Color card3BorderColor;
  Color skipButtonBackground;
  Color skipButtonTextColor;
  Color skipButtonBorderColor;
  Color checkButtonBackground;
  Color checkButtonTextColor;
  Color checkButtonBorderColor;
  Color resultBackground;
  Color resultTextColor;
  String checkText;
  Question currentQuestion;
  String currentAnswer;
  String currentResult;
  String currentResultText;
  bool isAnswered;
  int questionIndex=0;
  @override
  void initState() {
    // TODO: implement initState
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
    skipButtonBackground = Colors.white;
    skipButtonTextColor = Color(0xFFDCDCDC);
    skipButtonBorderColor = Color(0xFFDCDCDC);
    checkButtonBackground = Colors.white;
    checkButtonTextColor = Color(0xFFDCDCDC);
    checkButtonBorderColor = Color(0xFFDCDCDC);
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
    Question1Card firstOption = Question1Card(optionName: 'Man', imgURL: 'assets/images/man.png');
    Question1Card secondOption = Question1Card(optionName: 'Woman', imgURL: 'assets/images/man.png');
    Question1Card thirdOption = Question1Card(optionName: 'Cat', imgURL: 'assets/images/cat.png');
    Question firstQuestion = Question(
      question: 'Which one of the following is "THE MAN"?',
      option1: firstOption,
      option2: secondOption,
      option3: thirdOption,
      answer: 'Man'
    );
    setState(() {
      initUI();
      currentQuestion = firstQuestion;
      currentAnswer = '';
    });
  }
  void nextQuestion(){
    Question1Card firstOption = Question1Card(optionName: 'Milk', imgURL: 'assets/images/cat.png');
    Question1Card secondOption = Question1Card(optionName: 'Water', imgURL: 'assets/images/cat.png');
    Question1Card thirdOption = Question1Card(optionName: 'Bread', imgURL: 'assets/images/man.png');
    Question question = Question(
        question: 'Which one of the following is "Milk"?',
        option1: firstOption,
        option2: secondOption,
        option3: thirdOption,
        answer: 'Milk'
    );
    setState(() {
      initUI();
      currentQuestion = question;
      currentAnswer = '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesan'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 10),
              height: 8,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: Text(currentQuestion.question)
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
              height: 290,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(currentQuestion.option1.imgURL),
                                fit: BoxFit.contain
                              )
                            ),
                          ),
                          height: 110,
                          width: 110,
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
                        ),
                        Text(
                            currentQuestion.option1.optionName,
                        )
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        card1BorderColor = Colors.lightBlueAccent;
                        card1Background = Color(0xff9de6ff);
                        card3BorderColor = Colors.grey;
                        card3Background = Colors.white;
                        card2BorderColor = Colors.grey;
                        card2Background = Colors.white;
                        checkButtonTextColor = Colors.white;
                        checkButtonBackground = Colors.orangeAccent;
                        checkButtonBorderColor = Colors.orangeAccent;
                        currentAnswer = currentQuestion.option1.optionName;
                      });
                      //do something
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(currentQuestion.option2.imgURL),
                                        fit: BoxFit.contain
                                    )
                                ),
                              ),
                              height: 110,
                              width: 110,
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
                            ),
                            Text(
                              currentQuestion.option2.optionName,
                            )
                          ],
                        ),
                        onTap: (){
                          setState(() {
                            card2BorderColor = Colors.lightBlueAccent;
                            card2Background = Color(0xff9de6ff);
                            card1BorderColor = Colors.grey;
                            card1Background = Colors.white;
                            card3BorderColor = Colors.grey;
                            card3Background = Colors.white;
                            checkButtonTextColor = Colors.white;
                            checkButtonBackground = Colors.orangeAccent;
                            checkButtonBorderColor = Colors.orangeAccent;
                            currentAnswer = currentQuestion.option2.optionName;
                          });

                          //do something
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(currentQuestion.option3.imgURL),
                                        fit: BoxFit.contain
                                    )
                                ),
                              ),
                              height: 110,
                              width: 110,
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
                            ),
                            Text(
                              currentQuestion.option3.optionName,
                            )
                          ],
                        ),
                        onTap: (){
                          setState(() {
                            card3BorderColor = Colors.lightBlueAccent;
                            card3Background = Color(0xff9de6ff);
                            card1BorderColor = Colors.grey;
                            card1Background = Colors.white;
                            card2BorderColor = Colors.grey;
                            card2Background = Colors.white;
                            checkButtonTextColor = Colors.white;
                            checkButtonBackground = Colors.orangeAccent;
                            checkButtonBorderColor = Colors.orangeAccent;
                            currentAnswer = currentQuestion.option3.optionName;
                          });
                          //do something
                        },
                      ),
                    ],
                  )
                ],
              ),//the choice cards in here
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 3),
              height: 0.75,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                  color: resultBackground,
              ),
              child: ListTile(
                title: Text(
                    currentResult,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: resultTextColor
                    ),
                ),
                subtitle: Text(
                    currentResultText,
                  style: TextStyle(
                    color: resultTextColor,
                  ),
                ),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    setState(() {
                      nextQuestion();
                    });
                    //do something
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 5, 0, 15),
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        color: skipButtonBackground,
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          top: BorderSide(width: 1.0, color: skipButtonBorderColor),
                          left: BorderSide(width: 1.0, color: skipButtonBorderColor),
                          right: BorderSide(width: 1.0, color: skipButtonBorderColor),
                          bottom: BorderSide(width: 1.0, color: skipButtonBorderColor),
                        ),
                    ),
                    child: Center(
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                          color: skipButtonTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                        ),

                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    //do something
                      if(isAnswered){
                        setState(() {
                         nextQuestion();
                        });
                      }
                      else if(!isAnswered && currentAnswer == currentQuestion.answer){
                        setState(() {
                          isAnswered = true;
                          resultBackground = Color(0xff9de6ff);
                          resultTextColor = Color(0xff1e8bb7);
                          currentResult = 'CORRECT';
                        });
                      }
                      else if(!isAnswered){
                        setState(() {
                          isAnswered = true;
                          resultBackground = Color(0xffffb0b0);
                          resultTextColor = Color(0xff9d0000);
                          currentResult = 'WRONG';
                          currentResultText = 'correct answer is \"'+ currentQuestion.answer+'\"';
                        });
                      }
                      checkText = 'CONTINUE';



                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 15, 15),
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                        color: checkButtonBackground,
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          top: BorderSide(width: 1.0, color: checkButtonBorderColor),
                          left: BorderSide(width: 1.0, color: checkButtonBorderColor),
                          right: BorderSide(width: 1.0, color: checkButtonBorderColor),
                          bottom: BorderSide(width: 1.0, color: checkButtonBorderColor),
                        )
                    ),
                    child: Center(
                      child: Text(
                        checkText,
                        style: TextStyle(
                            color: checkButtonTextColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18
                        ),

                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
