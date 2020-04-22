import 'package:flutter/material.dart';
import 'package:lesan/screens/level_screen.dart';

class LanguageSelect extends StatelessWidget {
  static const routeName = 'language_select';

  @override
  Widget build(BuildContext context) {
    List<Lang> _languages = [
      Lang(languageName:'ትግርኛ',languageSymbolURL:'assets/images/tigray.png'),
      Lang(languageName:'Qafaraf',languageSymbolURL:'assets/images/afar.png'),
      Lang(languageName:'አማርኛ',languageSymbolURL:'assets/images/amhara.png'),
      Lang(languageName:'Oromiffa',languageSymbolURL:'assets/images/oromo.png')
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff1f2f2),
        title: Text(
          'I WANT TO LEARN',
          style: TextStyle(
            color: Color(0xff3a3042),
            fontSize: 14,
            fontWeight: FontWeight.w100
          )
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:
              _languages
                  .map(
                    (language) => InkWell(
                      onTap: () => Navigator.of(context).pushNamed(LevelScreen.routeName),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 0.5, color: Color(0xffff8d3b)),
                          )
                        ),
                        child: ListTile(
                          leading: Image(image: AssetImage(language.languageSymbolURL), height: 50, width: 50,),
                          title: Text(language.languageName, style: Theme.of(context).textTheme.body2,),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Lang{
  String languageName;
  String languageSymbolURL;
  Lang({this.languageName, this.languageSymbolURL});
}