import 'package:Fluttergram/services/amplify/amplify_service.dart';

class GqlAgent {
  factory GqlAgent() => instance;
  GqlAgent._internal();
  static final GqlAgent instance = GqlAgent._internal();

  Future<String?> mutation(
      String graphQLDocument, Map<String, dynamic> variables) async {
    final request = AmplifyService().API.mutation;

    final result = await request(graphQLDocument, variables);
    print(graphQLDocument);
    print(variables);
    print(result);

    return result.isEmpty ? null : result;
  }

  Future<String?> query(
      String graphQLDocument, Map<String, dynamic> variables) async {
    final request = AmplifyService().API.query;

    final result = await request(graphQLDocument, variables);

    return result.isEmpty ? null : result;
  }
}
