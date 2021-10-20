import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class User {
  final String? email;
  final String? id;
  final String? photoUrl;
  final String? username;
  final String? displayName;
  final String? bio;
  final Map? followers;
  final Map? following;

  const User({
    this.username,
    this.id,
    this.photoUrl,
    this.email,
    this.displayName,
    this.bio,
    this.followers,
    this.following,
  });

  factory User.fromDocument(Map document) {
    return User(
      email: document['email'],
      username: document['username'],
      photoUrl: document['photoUrl'],
      id: document['id'],
      displayName: document['displayName'],
      bio: document['bio'],
      followers: document['followers'],
      following: document['following'],
    );
  }

  factory User.fromAuthUser(AuthUser auser) {
    return User(id: auser.userId, username: auser.username);
  }
}
