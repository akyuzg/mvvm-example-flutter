import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';
import 'package:mvvm_example_flutter/features/authenticate/splash/service/splash_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  SplashService? splashService;
  setUp(() {
    splashService = SplashService(NetworkManager.getInstance());
  });
  test('Fetch splash', () async {
    final response = await splashService?.getSplash();

    expect(response, isNotNull);
    expect(response?.data, isNotNull);
  });
}
