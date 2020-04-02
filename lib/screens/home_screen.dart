import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mocker')
      ),
      body: Center(
        child: Text('Duolingo Mockito'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
