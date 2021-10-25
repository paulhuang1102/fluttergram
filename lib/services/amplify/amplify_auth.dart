part of './amplify_service.dart';

class AmplifyAuth {
  factory AmplifyAuth() => instance;
  AmplifyAuth._internal();

  static final AmplifyAuth instance = AmplifyAuth._internal();

  Future<bool> signInGoogle() async {
    try {
      var res =
          await Amplify.Auth.signInWithWebUI(provider: AuthProvider.google);
      print(res);
      return true;
    } on AmplifyException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signInFB() async {
    try {
      var res =
          await Amplify.Auth.signInWithWebUI(provider: AuthProvider.facebook);
      print(res);
      return true;
    } on AmplifyException catch (e) {
      print(e);
      return false;
    }
  }

  signout() {
    try {
      Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<bool> checkAuthStatus() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession();
      return result.isSignedIn;
    } catch (_) {
      return false;
    }
  }

  Future<AuthUser?> fetchUser() async {
    try {
      final u = await Amplify.Auth.getCurrentUser();

      return u;
    } catch (e) {}
  }

  Future<List<AuthUserAttribute>> fetchAttrs() async {
     var res = await Amplify.Auth.fetchUserAttributes();
     

      return res;
  }
}
