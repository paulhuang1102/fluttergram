import '../models/api_reponse_model.dart';
import '../services/amplify/amplify_service.dart';
import '../utils/logger.dart';

class GqlAgent {
  factory GqlAgent() => instance;
  GqlAgent._internal();
  static final GqlAgent instance = GqlAgent._internal();

  Future<APIResponse> mutation(
      String graphQLDocument, Map<String, dynamic> variables) async {
    final request = AmplifyService().API.mutation;

    final result = await request(graphQLDocument, variables);
    return result;
  }

  Future<APIResponse> query(
      String graphQLDocument, Map<String, dynamic> variables) async {
    final request = AmplifyService().API.query;

    final result = await request(graphQLDocument, variables);

    return result;
  }
}
