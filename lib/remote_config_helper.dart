import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigHelper {
  static final RemoteConfigHelper _singleton = RemoteConfigHelper._internal();
  static final remoteConfig = FirebaseRemoteConfig.instance;
  factory RemoteConfigHelper() {
    return _singleton;
  }
  RemoteConfigHelper._internal();

  FirebaseRemoteConfig getRemoteConfig() {
    return remoteConfig;
  }

  Future<void> initialize() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.setDefaults(const {
      "example_param_1": 42,
      "example_param_2": 3.14159,
      "example_param_3": true,
      "example_param_4": "Hello, world!",
    });
    await remoteConfig.fetchAndActivate();
  }
}
