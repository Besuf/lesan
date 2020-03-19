import 'dart:io';

import 'package:lesan/core/providers/base_model.dart';
import 'package:lesan/core/services/api/authentication_service.dart';
import 'package:lesan/locator.dart';

class AuthModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String _errorMessage;

  AuthModel() {
    _errorMessage = '';
  }

  String get errorMessage => _errorMessage;

  void clearErrors() {
    _errorMessage = '';
  }

  Future<bool> login(String email, String password) async {
    clearErrors();
    setViewState(ViewState.Busy);
    try {
      await _authenticationService.login(email, password);
      setViewState(ViewState.Idle);

      return true;
    }
    on SocketException catch (se) {
      _errorMessage = 'Connection could not be estabilished. Make sure you are connected';
      print('Socket exception');
    }
    on Exception catch(e) {
      print(e);
      _errorMessage = '$e';
    }
    setViewState(ViewState.Idle);

    return false;
  }

  Future<bool> signUp(Map<String, dynamic> body) async {
    clearErrors();
    setViewState(ViewState.Busy);
    try {
      await _authenticationService.signUp(body);
      setViewState(ViewState.Idle);

      return true;
    }
    on SocketException catch (se) {
      _errorMessage = 'Connection could not be estabilished. Make sure you are connected';
      print('Socket exception');
    }
    on Exception catch(e) {
      print(e);
      _errorMessage = '$e';
    }
    setViewState(ViewState.Idle);

    return false;
  }

  Future<bool> loginAnon() async {
    await _authenticationService.loginAnon();

    return true;
  }

  Future<void> logout() async {
    await _authenticationService.logout();
  }
}