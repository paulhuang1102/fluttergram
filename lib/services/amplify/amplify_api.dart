part of './amplify_service.dart';

class AmplifyApi {
  factory AmplifyApi() => instance;
  AmplifyApi._internal();

  static final AmplifyApi instance = AmplifyApi._internal();

  Future<APIResponse> mutation(
    String graphQLDocument,
    Map<String, dynamic> variables,
  ) async {
    try {
      var request = GraphQLRequest<String>(
          document: graphQLDocument, variables: variables);
      var operation = Amplify.API.mutate(request: request);
      var response = await operation.response;

      var data = response.data;

      return APIResponse.fromAPIString(data);
    } on ApiException catch (e) {
      Log.error('Query failed: $e');
      return APIResponse(errors: [e]);
    } catch (e) {
      return APIResponse(errors: [e]);
    }
  }

  Future<APIResponse> query(
    String graphQLDocument,
    Map<String, dynamic> variables,
  ) async {
    try {
      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
              document: graphQLDocument, variables: variables));

      var response = await operation.response;
      var data = response.data;

      return APIResponse.fromAPIString(data);
    } on ApiException catch (e) {
      Log.error('Query failed: $e');
      return APIResponse(errors: [e]);
    } catch (e) {
            Log.error('Error: $e');

      return APIResponse(errors: [e]);
    }
  }
}
