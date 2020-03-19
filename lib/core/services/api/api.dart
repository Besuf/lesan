import 'dart:convert';
import 'dart:io';
import 'package:lesan/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:lesan/core/utils/constants.dart';
import 'package:flutter/foundation.dart';

enum HttpMethod { GET, POST, PATCH, DELETE }

/// The service responsible for networking requests
class Api {
  var client = new http.Client();

  Future<String> loadApiEndpoint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(IP_ADDRESS_KEY) ?? BASE_API;
  }

  Future<String> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return jsonDecode(prefs.getString(USER_KEY))['token'];
  }

  Future<User> authenticateUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginEndpoint = prefs.getString(IP_ADDRESS_KEY);
    if (loginEndpoint == null || loginEndpoint == '') {
      loginEndpoint = BASE_API;
    }
    print('Login $loginEndpoint/api/login');

    var response = await client.post('$loginEndpoint/api/auth/login',
        body: {'email': email, 'password': password});

    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return User.fromJson(body['data']);
    } else if (response.statusCode == 400) {
      var message = '${body['message']} \n';
      if (body['data'] != null) {
        message += body['data']['password'] != null
            ? '${body['data']['password'][0]} \n'
            : '';
        message +=
        body['data']['email'] != null ? '${body['data']['email'][0]} \n' : '';
      }

      throw new Exception(message);
    } else if (response.statusCode == 401) {
      throw new Exception('Invalid email or password');
    } else if (response.statusCode >= 500) {
      throw new Exception('Server error, please try again');
    } else {
      print('Response ${response.body}');
      throw new Exception('Unknow error has occured, please try again');
    }
  }

  Future<bool> signUpUser(Map<String, dynamic> msgBody) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var endpoint = prefs.getString(IP_ADDRESS_KEY);
    if (endpoint == null || endpoint == '') {
      endpoint = BASE_API;
    }
    print('Signup $endpoint/api/signup');

    var response = await client.post('$endpoint/api/auth/signup', body: msgBody);

    var body = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 400) {
      var message = '${body['message']} \n';
      if (body['data'] != null) {
        List<String> keys = ['email', 'password', 'name', 'passwordConfirm'];
        for (var k in keys) {
          message += body['data'][k] != null
              ? '${body['data'][k]} \n'
              : '';
        }
      }

      throw new Exception(message);
    } else if (response.statusCode == 401) {
      throw new Exception('Invalid email or password');
    } else if (response.statusCode >= 500) {
      throw new Exception('Server error, please try again');
    } else {
      print('Response ${response.body}');
      throw new Exception('Unknow error has occured, please try again');
    }
  }

  ///
  /// Make a generic api request for better error handling nd smoother functionality
  /// [method] Method of the Http request
  /// [url] Url of the request
  /// [body?] optional body field
  /// [header] optional header field
  Future<dynamic> makeApiRequest(
      {@required HttpMethod method,
      @required url,
      int perPage,
      int page,
      Map<String, dynamic> body,
      Map<String, String> headers}) async {

    String endPoint = await loadApiEndpoint();
    String token = await loadToken();
    String messagesUrl = '$endPoint/$url';
    body = body == null ? {} : body;
    headers = headers == null ? {} : headers;
    headers = { ...headers, 'Authorization': 'Bearer $token'};

    if (perPage != null) {
      messagesUrl += '?paginate_count=$perPage';
    }
    if (page != null) {
      messagesUrl += '&page=$page';
    }

    print('Make Api Request $messagesUrl');
    try {
      var results;
      if (method == HttpMethod.POST) {
        results = await client.post(messagesUrl, headers: headers, body: body);
      } else {
        results = await client.get(messagesUrl, headers: headers);
      }

      if (results.statusCode == 200) {
        return jsonDecode(results.body);
      } else if (results.statusCode == 401 || results.statusCode == 400) {
        print(results.body);
        throw new Exception('You are not authorized to view payment messages');
      } else if (results.statusCode >= 500) {
        throw new Exception('Server error, please try again');
      } else {
        print(results.body);
        throw new Exception('Unknow error has occured, please try again');
      }
    } on SocketException catch(se) {
      print('Caught error $se');
      throw new Exception('Connection could not be establised. Make sure you are connected to LAN and try again.');
    } on Exception catch(e) {
      throw new Exception('Unknown Error. $e');
    }
  }

}
