import 'package:flutter/material.dart';
import 'package:lesan/core/providers/base_model.dart';
import 'package:lesan/core/providers/auth_model.dart';
import 'package:lesan/ui/shared/ui_helpers.dart';
import 'package:lesan/ui/views/base_view.dart';
import 'package:lesan/ui/widgets/shared/error_alert.dart';
import 'package:lesan/ui/widgets/shared/loading_widget.dart';
import 'package:lesan/ui/widgets/shared/shared_drawer.dart';

class SignUpView extends StatelessWidget {
  static const String routeName = 'sign_up_view';

  final TextEditingController nameController =
  TextEditingController(text: 'Sonnie');
  final TextEditingController emailController =
  TextEditingController(text: 'sonnie@gmail.com');
  final TextEditingController passwordController =
  TextEditingController(text: 'secret');
  final TextEditingController passwordConfirmController =
  TextEditingController(text: 'secret');

  Widget _formBody(context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: nameController,
          decoration: InputDecoration(hintText: 'Name'),
        ),
        UIHelper.verticalSpaceSmall(),
        TextField(
          controller: emailController,
          decoration: InputDecoration(hintText: 'Email'),
        ),
        UIHelper.verticalSpaceSmall(),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(hintText: 'Password'),
        ),
        UIHelper.verticalSpaceSmall(),
        TextField(
          controller: passwordConfirmController,
          obscureText: true,
          decoration: InputDecoration(hintText: 'Password Confirm'),
        ),
        UIHelper.verticalSpaceSmall(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('SignUp'),
          centerTitle: true,
        ),
        drawer: SharedDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _formBody(context),
                errorAlert(context, model.errorMessage),
                model.state == ViewState.Busy
                    ? LoadingWidget()
                    : RaisedButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    Map<String, dynamic> msgBody = {
                      'email': emailController.text,
                      'name': nameController.text,
                      'password': passwordController.text,
                      'passwordConfirm': passwordConfirmController.text
                    };

                    print('Login');
                    final bool success = await model.signUp(msgBody);
                    if (success) {
                      Navigator.of(context).pop();
                    } else {
                      print('Signup Fail');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}