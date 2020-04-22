import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesan/screens/level_screen.dart';
import 'package:lesan/models/questionTypes.dart';
import 'package:audioplayers/audio_cache.dart';


enum AnswerState { Correct, Wrong, NotAnswered }

class WordPuzzle extends StatefulWidget {
  static const routeName = 'work_puzzle';
  final Module module;
  final int index;
  WordPuzzle({Key key, @required this.module, this.index}): super(key: key);
  @override
  _WordPuzzleState createState() => _WordPuzzleState();
}

class WordChip extends StatelessWidget {
  final Word2 _word;

  WordChip(this._word);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: _word.selected ? Colors.white24 : Color(0xff5d5d5d),
      label: Text(
        _word.text,
        style: TextStyle(
          color: _word.selected ? Colors.white24 : Colors.white,
        ),
      ),
      shadowColor: Colors.black,
    );
  }
}

class _WordPuzzleState extends State<WordPuzzle> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Module module;
  int index;
  int _currentIndex = 0;
  bool _puzzleChecked = false;
  String checkText = 'Check';
  bool isCorrect = false;
  Question2 _puzzle;
  double progress;
  List<Word2> _selectedWords = [];
  AnswerState _answerState;
  String _textContent = '';
  Color checkButtonBackground = Color(0xff3a3042);

  @override
  void initState() {
    // TODO: implement initState
    module = widget.module;
    index = widget.index;
    progress = 0.6666 + ((index)/(module.chooseImages.length))/3;
    _answerState = AnswerState.NotAnswered;
    super.initState();
    _puzzle = module.wordPuzzels[index];

  }
  void _selectWord(Word2 word) {
    setState(() {
      _selectedWords.add(word);
      word.selected = true;
    });
  }

  void _removeSelection(Word2 word) {
    setState(() {
      word.selected = false;
      _selectedWords.remove(word);
    });
  }
  void playSound(String fileName){
    final player  = AudioCache();
    player.play(fileName);
  }
  void _checkAnswer() {
    if (listEquals(_puzzle.correctSequence, _selectedWords)) {
      correctAnswer();

    } else {
      String t1='';
      for(int i=0; i<_puzzle.correctSequence.length; i++){
        t1+= _puzzle.correctSequence[i].text + ' ';
      }
      wrongAnswer(t1);

    }
    setState(() {
      _puzzleChecked = true;
    });
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
  void _gotoNextPuzzle() {
    int nextIndex;
    if(module.wordPuzzels.length==this.index+1){
      nextIndex = 0;
      progress = 1;
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          content: Text(
            'Finished questions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.black12,
        ),
      );
    }
    else{
      nextIndex = this.index + 1;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WordPuzzle(
          module: this.module,
          index: nextIndex,
        )),
      );
    }
  }

  Widget _renderSource() {
    return Column(
      children: <Widget>[
        Text(
          'Write this in Tigrigna',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color(0xfff1f1f2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            _puzzle.sourceText,
         style: TextStyle(
           color: Color(0xff3a3042),
         ),
          ),
        ),
      ],
    );
  }

  Widget _renderChoice() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Wrap(
        spacing: 10.0,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: _selectedWords
            .map(
              (word) => GestureDetector(
                onTap: () {
                  _removeSelection(word);
                },
                child: Chip(
                  backgroundColor: Color(0xff5d5d5d),
                  label: Text(
                      word.text,
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _renderSelectionList() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20.0,
      children: _puzzle
          .wordChoices
          .map(
            (choice) => GestureDetector(
              child: WordChip(choice),
              onTap: () {
                _selectWord(choice);
              },
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: _answerState==AnswerState.NotAnswered?
               MainAxisAlignment.spaceAround:
               MainAxisAlignment.spaceBetween
            ,
            children: <Widget>[
//              _answerState==AnswerState.NotAnswered? Container(
//                height: 0,
//              ): Container(
//                height: 5,
//              ),
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

              _renderSource(),
              _renderChoice(),
              _renderSelectionList(),
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
                                  if(_answerState==AnswerState.NotAnswered){
                                    _checkAnswer();
                                    setState(() {
                                      progress = 0.666 + ((index+1)/(module.chooseImages.length))/3;
                                    });
                                    String t1,t2='';
                                    Color background;
                                    if(_answerState == AnswerState.Correct){
                                      playSound('audios/correct.wav');
                                      checkButtonBackground = Color(0xffff8d3b);
                                    }else{
                                      playSound('audios/incorrect.wav');
                                      checkButtonBackground = Color(0xff3a3042);
                                    }
                                    checkText = 'Continue';
                                  }else{
                                    //nextQuestion();
                                    _gotoNextPuzzle();
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
        ),
      ),

    );
  }
}
