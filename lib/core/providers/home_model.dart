import 'package:lesan/core/providers/base_model.dart';
import 'package:lesan/core/services/api/authentication_service.dart';
import 'package:lesan/locator.dart';

class HomeModel extends BaseModel {
  AuthenticationService _authenticationService = locator<AuthenticationService>();

}