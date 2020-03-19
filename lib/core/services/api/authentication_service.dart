import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lesan/core/models/user.dart';
import 'package:lesan/core/utils/constants.dart';
import 'package:lesan/locator.dart';
import 'package:lesan/core/services/api/api.dart';

class AuthenticationService {
  Api _api = locator<Api>();
  StreamController<User> _userController = StreamController<User>();

  User _currentUser;

  AuthenticationService() {
    checkAuthInit();
  }

  Future<void> checkAuthInit() async {
    print('Check Init auth');
    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.remove('user');
    String user = prefs.getString(USER_KEY);
//    print('Stored User $user');
    if (user != null && user != '') {
      _add(User.fromPreference(jsonDecode(user)));
    } else {
      _add(null);
    }
  }

  Stream<User> get onAuthStateChanged => _userController.stream;

  User get currentUser => _currentUser;

  void _add(User user) {
    _currentUser = user;
    _userController.add(user);
  }

  Future<bool> login(String email, String password) async {
    User user = await _api.authenticateUser(email, password);

    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(USER_KEY, jsonEncode(user.toJson()));
      _add(user);

      return true;
    }
    _add(null);

    return false;
  }

  Future<bool> signUp(Map<String, dynamic> body) async {
    return  await _api.signUpUser(body);
  }

  Future<bool> loginAnon() async {
    User user = User.initial();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
    _add(user);

    return true;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(USER_KEY);
    _add(null);
  }

  void dispose() {
    _userController.close();
    print('Dispose user controller');
  }
}