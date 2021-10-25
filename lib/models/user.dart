import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class User {
  final String? email;
  final String id;
  final String? photoUrl;
  final String? username;
  final String? displayName;
  final String? bio;
  final int? followers;
  final int? following;

  const User({
    this.username,
    required this.id,
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
      photoUrl: document['avatarImageURL'],
      id: document['id'],
      displayName: document['name'],
      bio: document['about'],
      followers: document['follower'],
      following: document['following'],
    );
  }

  factory User.fromAuthUser(AuthUser auser) {
    return User(id: auser.userId, username: auser.username);
  }

  copyWith({
    username,
    photoUrl,
    email,
    displayName,
    bio,
    followers,
    following,
  }) {
    return User(
      id: this.id,
      username: username ?? this.username,
      photoUrl: this.photoUrl,
      displayName: displayName ?? this.displayName,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      bio: bio ?? this.bio,
    );
  }
}
