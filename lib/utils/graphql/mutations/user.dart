const String createUser = '''
  mutation CreateUser(\$name: String, \$username: String!, \$email: String, \$about: String, \$avatarImageURL: String, \$following: Int, \$follower: Int, \$cognitoId: String! ) {
    createUser(input: {about: \$about, avatarImageURL: \$avatarImageURL, email: \$email, follower: \$follower, following: \$following, name: \$name, username: \$username, cognitoId: \$cognitoId}) {
      email
      username
      name
    }
  }
''';


