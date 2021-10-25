// import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import '../../models/api_reponse_model.dart';
import '../../models/user.dart';
import '../../amplifyconfiguration.dart';
import '../../utils/logger.dart';

part './amplify_auth.dart';
part './amplify_api.dart';

class AmplifyService {
  factory AmplifyService() => instance;
  AmplifyService._internal();
  static final AmplifyService instance = AmplifyService._internal();

  bool _isInit = false;
  AmplifyAuth get Auth => AmplifyAuth(); 
  AmplifyApi get API => AmplifyApi();
  bool get isInit => _isInit;

  _configureAmplify() async {
    Amplify.addPlugin(AmplifyAuthCognito());
    // Amplify.addPlugin(AmplifyStorageS3());
    // Amplify.addPlugin(AmplifyAnalyticsPinpoint());
    Amplify.addPlugin(AmplifyAPI());

    // Once Plugins are added, configure Amplify
    try {
      await Amplify.configure(amplifyconfig);
      print('Amplify configured!');

    } on AmplifyAlreadyConfiguredException {
    }
  }

  Future<void> init() async {
    if (_isInit) {
      return;
    }

    await _configureAmplify();
    _isInit = true;
  }
}