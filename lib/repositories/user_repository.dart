import '../services/amplify/amplify_service.dart';
import '../models/user.dart';
import '../utils/gql_agent.dart';
import '../utils/graphql/queries/user.dart';
import '../models/api_reponse_model.dart';
import '../utils/logger.dart';
import '../utils/graphql/mutations/user.dart';

class UserRepository {
  static User? user;
  static bool isTokenValid = false;

  Future<User?> loginUser() async {
    final auser = await AmplifyService().Auth.fetchUser();

    if (auser != null) {
      final attrs = await AmplifyService().Auth.fetchAttrs();
      Log.debug(auser.userId);

      User user = User.fromAuthUser(auser);

      attrs.forEach((element) {
        if (element.userAttributeKey == 'email') {
          user = user.copyWith(email: element.value);
        }
      });

      Log.debug(user.id);


      return user;
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

  Future<User?> fetchUserData(String cognitoId) async {
    final res = await GqlAgent()
        .query(UserQuery.getUserByPoolQ, {'cognitoId': cognitoId});
    final data = res.data![UserQuery.getUserByPool];

    print(res);

    if (data['items'].length < 1) {
      return null;
    }
    return User.fromDocument(data['items'][0]);
  }

  Future<APIResponse> createUserData({
    required String username,
    required String cognitoId,
    String? name,
    String? email,
  }) {
    return GqlAgent().mutation(createUser, {
      'username': username,
      'cognitoId': cognitoId,
      'name': name,
      'email': email,
    });
  }
}
