import 'package:flutter/material.dart';
import 'package:lesan/ui/views/auth/signup_view.dart';
import 'package:lesan/ui/widgets/shared/shared_drawer.dart';
import 'package:lesan/core/providers/base_model.dart';
import 'package:lesan/core/providers/auth_model.dart';
import 'package:lesan/ui/shared/ui_helpers.dart';
import 'package:lesan/ui/views/base_view.dart';
import 'package:lesan/ui/widgets/shared/error_alert.dart';
import 'package:lesan/ui/widgets/shared/loading_widget.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'login_view';

  final TextEditingController emailController =
      TextEditingController(text: 'titan@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'secret');

  Widget _formBody(context) {
    return Column(
      children: <Widget>[
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        drawer: SharedDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _formBody(context),
              errorAlert(context, model.errorMessage),
              model.state == ViewState.Busy
                  ? LoadingWidget()
                  : RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        print('Login');
                        model.login(
                            emailController.text, passwordController.text);
                      },
                    ),
              InkWell(
                onTap: () {
                  model.clearErrors();
                  Navigator.of(context).pushNamed(SignUpView.routeName);
                },
                child: Text(
                  'Signup',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
