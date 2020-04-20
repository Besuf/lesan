import 'package:flutter/material.dart';

enum AnswerState { Correct, Wrong, NotAnswered }

class SampleScreen extends StatefulWidget {
  static String routeName = 'sample_screen';

  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  AnswerState _answerState = AnswerState.NotAnswered;
  String _textContent = '';

  void correctAnswer() {
    setState(() {
      _answerState = AnswerState.Correct;
      _textContent = 'Correct Answer';
    });
  }

  void wrongAnswer() {
    setState(() {
      _answerState = AnswerState.Wrong;
      _textContent = 'Incorrect answer answer is ...';
    });
  }

  void reset() {
    setState(() {
      _answerState = AnswerState.NotAnswered;
      _textContent = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(child: Center(child: Text('Question Content'))),
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
                        color: _answerState == AnswerState.Correct
                            ? Colors.green[400]
                            : Colors.red[400],
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 10.0),
                          child: Text(
                            _textContent,
                            style: TextStyle(
                              color: Colors.white,
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
                      width: double.infinity,
                      color: Colors.green[700],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: correctAnswer,
                            icon: Icon(Icons.check,
                                color: Colors.white, size: 40),
                          ),
                          IconButton(
                            onPressed: wrongAnswer,
                            icon: Icon(Icons.exit_to_app,
                                color: Colors.red, size: 40),
                          ),
                          IconButton(
                            onPressed: reset,
                            icon: Icon(Icons.restore,
                                color: Colors.black, size: 40),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
