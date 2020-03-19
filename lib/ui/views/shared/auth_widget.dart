import 'package:flutter/material.dart';
import 'package:lesan/core/models/user.dart';
import 'package:lesan/ui/views/home_view.dart';
import 'package:lesan/ui/views/auth/login_view.dart';
import 'package:lesan/ui/widgets/shared/loading_widget.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? HomeView() : LoginView();
    }
    return Scaffold(
      body: LoadingWidget(),
    );
  }
}
