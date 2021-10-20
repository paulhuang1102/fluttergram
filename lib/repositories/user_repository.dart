import '../services/amplify/amplify_service.dart';
import '../models/user.dart';

class UserRepository {
  bool _isTokenValid = false;
  User? _user;

  get user => _user;
  get isTokenValid => _isTokenValid;

  Future<User?> loginUser() async {
    final user = await AmplifyService().Auth.fetchUser();
    if (user != null) {
      return User.fromAuthUser(user);
    }
  }

  Future<bool> checkUser() {
    return AmplifyService().Auth.checkAuthStatus();
  }

  logut() {
    return AmplifyService().Auth.signout();
  }

  Future<bool> signInGoogle() {
    return AmplifyService().Auth.signInGoogle();
  }

  Future<bool> signInFB() {
    return AmplifyService().Auth.signInFB();
  }
}
