const String createUser = '''
  mutation CreateUser(\$name: String!, \$username: String!, \$email: String!, \$about: String, \$avatarImageURL: String!, \$following: Int!, \$follower: Int! ) {
    createUser(input: {about: \$about, avatarImageURL: \$avatarImageURL, email: \$email, follower: 0, following: 0 , name: \$name, username: \$username}) {
      avatarImageURL
      email
      username
      name
    }
  }
''';


