import 'dart:convert';

class APIResponse {
  List<dynamic>? errors;
  Map<String, dynamic>? data;

  APIResponse({this.errors, this.data});

  factory APIResponse.fromAPIString(String str) {
    Map<String, dynamic> res;
    try {
      res = json.decode(str);
    } catch (e) {
      return APIResponse(errors: [e]);
    }

    return APIResponse(data: res);
  }
}
