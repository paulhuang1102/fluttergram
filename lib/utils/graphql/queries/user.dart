class UserQuery {
  static const String getUserByPool = 'getUserByUserName';
  
  static const String getUserByPoolQ = '''
    query ${UserQuery.getUserByPool}(\$cognitoId: String!) {
      ${UserQuery.getUserByPool}(cognitoId: \$cognitoId) {
        nextToken
        items {
          id
          about
          avatarImageURL
          createdAt
          email
          follower
          following
          name
          username
        }
      }
    }
  ''';
}
