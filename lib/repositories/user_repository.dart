import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import '../services/amplify/amplify_service.dart';
import '../models/user.dart';

class UserRepository {
  bool _isTokenValid = false;
  User? _user;

  get user => _user;
  get isTokenValid => _isTokenValid;

  Future<AuthUser?> loginUser() {
    return AmplifyService().Auth.fetchUser();
  }

  Future<bool> checkUser() {
    return AmplifyService().Auth.checkAuthStatus();
  }

  logut() {
    return AmplifyService().Auth.signout();
  }
}
