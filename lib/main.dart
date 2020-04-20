import 'package:flutter/material.dart';
import 'package:flutter/services.dart' ;
import 'package:lesan/screens/home_screen.dart';
import 'package:lesan/screens/language_select.dart';
import 'package:lesan/screens/sample_screen.dart';
import 'package:lesan/screens/word_puzzle_screen.dart';
import 'package:lesan/screens/level_screen.dart';
import 'package:lesan/screens/chooseImage_screen.dart';
import 'package:lesan/screens/writeSentence_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.green[600],

        // Define the default font family.
        fontFamily: 'Raleway',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(
            fontSize: 36.0,
          ),
          body1: TextStyle(fontSize: 14.0, color: Colors.black87),
          body2: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
      ),
      initialRoute: LevelScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        LanguageSelect.routeName: (_) => LanguageSelect(),
        WordPuzzle.routeName: (_) => WordPuzzle(),
        LevelScreen.routeName: (_) => LevelScreen(),
        ChooseImageScreen.routeName: (_)=>ChooseImageScreen(),
        WriteSentenceScreen.routeName: (_)=>WriteSentenceScreen(),
        SampleScreen.routeName: (_) => SampleScreen()
      },
    );
  }
}
