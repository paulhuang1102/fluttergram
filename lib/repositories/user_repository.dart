import 'package:Fluttergram/utils/graphql/mutations/user.dart';

import '../services/amplify/amplify_service.dart';
import '../models/user.dart';
import '../utils/gql_agent.dart';
import '../utils/graphql/queries/user.dart';

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

  fetchUserData() {
    return GqlAgent().query(getUser, {'username': '123'});
  }

  createUserData() {
    return GqlAgent().mutation(createUser, {
      'username': '123',
      'name': 'paul',
      'email': 'paul@email.com',
      'avatarImageURL': 'https://google.com'
    });
  }
}
