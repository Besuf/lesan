import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:just_audio/just_audio.dart';

class Puzzle {
  String sourceText;
  List<Word> wordChoices;
  List<Word> correctSequence;

  Puzzle({this.sourceText, this.wordChoices, this.correctSequence});
}

class Word {
  String text;
  bool selected = false;

  Word(this.text);

  @override
  bool operator ==(other) => other is Word && other.text == text;

  @override
  int get hashCode => text.hashCode;
}

class WordPuzzle extends StatefulWidget {
  static const routeName = 'work_puzzle';

  @override
  _WordPuzzleState createState() => _WordPuzzleState();
}

class WordChip extends StatelessWidget {
  final Word _word;

  WordChip(this._word);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: _word.selected ? Colors.grey[600] : Colors.grey[400],
      label: Text(
        _word.text,
        style: TextStyle(
          color: _word.selected ? Colors.grey[600] : Colors.black,
        ),
      ),
      shadowColor: Colors.black,
    );
  }
}

class _WordPuzzleState extends State<WordPuzzle> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;
  bool _puzzleChecked = false;
  final List<Puzzle> _puzzles = [
    Puzzle(
      sourceText: 'I drink',
      wordChoices: [
        Word('ጠጣሁ'),
        Word('እኔ'),
        Word('እሱ'),
        Word('በላ'),
        Word('ጠጣሁ'),
        Word('እኔ'),
        Word('እሱ'),
        Word('በላ')
      ],
      correctSequence: [Word('እኔ'), Word('ጠጣሁ')],
    ),
    Puzzle(
      sourceText: 'He ate',
      wordChoices: [
        Word('ጠጣሁ'),
        Word('እኔ'),
        Word('እሱ'),
        Word('በላ'),
        Word('ጠጣሁ'),
        Word('እኔ'),
        Word('እሱ'),
        Word('በላ')
      ],
      correctSequence: [Word('እሱ'), Word('በላ')],
    ),
  ];
  List<Word> _selectedWords = [];

  void _selectWord(Word word) {
    setState(() {
      _selectedWords.add(word);
      word.selected = true;
    });
  }

  void _removeSelection(Word word) {
    setState(() {
      word.selected = false;
      _selectedWords.remove(word);
    });
  }

  void _checkAnswer() {
    if (listEquals(_puzzles[_currentIndex].correctSequence, _selectedWords)) {
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
    } else {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          content: Text(
            'Incorrect!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
    setState(() {
      _puzzleChecked = true;
    });
  }

  void _gotoNextPuzzle() {
    if (_puzzles.length - 1 > _currentIndex) {
      setState(() {
        _puzzleChecked = false;
        _currentIndex++;
        _selectedWords = [];
      });
    } else {
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
  }

  Widget _renderSource() {
    return Column(
      children: <Widget>[
        Text('Write this in Amharic'),
        SizedBox(
          height: 10.0,
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Text(_puzzles[_currentIndex].sourceText),
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
                  label: Text(word.text),
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
      children: _puzzles[_currentIndex]
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _renderSource(),
          _renderChoice(),
          _renderSelectionList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_puzzleChecked) {
            _gotoNextPuzzle();
          } else {
            _checkAnswer();
          }
        },
        child: _puzzleChecked ? Icon(Icons.arrow_forward) : Icon(Icons.check),
      ),
    );
  }
}
