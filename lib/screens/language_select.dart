import 'package:flutter/material.dart';

class LanguageSelect extends StatelessWidget {
  static const routeName = 'language_select';

  @override
  Widget build(BuildContext context) {
    List<String> _languages = ['Amharic', 'English'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'I want to learn',
          style: Theme.of(context).textTheme.body1,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: _languages
                .map(
                  (language) => Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0)
                      )
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Theme.of(context).accentColor,
                      ),
                      title: Text(language, style: Theme.of(context).textTheme.body2,),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
