import 'package:flutter/material.dart';
import 'package:lesan/core/providers/home_model.dart';
import 'package:lesan/core/providers/auth_model.dart';
import 'package:lesan/ui/shared/text_styles.dart';
import 'package:lesan/ui/shared/ui_helpers.dart';
import 'package:lesan/ui/views/base_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    final loginModel = Provider.of<AuthModel>(context);

    return Scaffold(
      body: Container(
        child: Center(
          child: Card(
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/flag.jpg'),
                Text('Amharic')
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: loginModel.logout,
      ),
    );
  }
}
