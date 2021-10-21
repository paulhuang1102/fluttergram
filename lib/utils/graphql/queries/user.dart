const String getUser = '''
  mutation getUser(\$username) {
    getUser(input: {username: \$username}) {
      avatarImageURL
      email
      username
      name
    }
  }
''';