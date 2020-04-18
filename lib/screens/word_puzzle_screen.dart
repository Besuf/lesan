import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lesan/screens/level_screen.dart';
import 'package:lesan/models/questionTypes.dart';
import 'package:audioplayers/audio_cache.dart';



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
      backgroundColor: _word.selected ? Colors.white24 : Colors.green,
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
  @override
  void initState() {
    // TODO: implement initState
    module = widget.module;
    index = widget.index;
    progress = 0.6666 + ((index)/(module.chooseImages.length))/3;
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
      isCorrect = true;

    } else {
      isCorrect = false;

    }
    setState(() {
      _puzzleChecked = true;
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
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            _puzzle.sourceText,
         style: TextStyle(
           color: Colors.white,
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
                  backgroundColor: Colors.green,
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
        child: Column(
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
            _renderSource(),
            _renderChoice(),
            _renderSelectionList(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    _checkAnswer();
                    setState(() {
                      if(checkText=='Check'){
                        setState(() {
                          progress = 0.666 + ((index+1)/(module.chooseImages.length))/3;
                        });
                        String t1,t2='';
                        Color background;
                        if(isCorrect){
                          playSound('audios/correct.wav');
                          t1 = 'Correct';
                          t2 = '';
                          background = Colors.greenAccent;
                        }else{
                          playSound('audios/incorrect.wav');
                          t1 = 'Incorrect';
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
                        //nextQuestion();
                        _gotoNextPuzzle();
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
          ],
        ),
      ),

    );
  }
}
